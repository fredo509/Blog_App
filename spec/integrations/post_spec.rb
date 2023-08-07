require_relative '../rails_helper'

RSpec.describe 'Posts', type: :system, js: true do
  describe 'index page' do
    before(:example) do
      @user = User.create(
        name: 'Fredo', 
        photo: 'https://th.bing.com/th/id/R.7bef3acf80b4711c6de8115d2d775498?rik=oKsNFA%2flG5lGXg&riu=http%3a%2f%2fkrewfirm.files.wordpress.com%2f2010%2f07%2f2009_diary_of_a_tired_black_man_001.jpg&ehk=5HEpTg0xdXCQ3SvDtF%2brKjSoVdmZdczBl85tRTCsBks%3d&risl=&pid=ImgRaw&r=0',
        bio: 'Full-Stack Dev', 
        number_of_post: 0,
        email: 'fredo509@gmail.com',
        password: '123456'
    )
    @user.save!

    @first_post = Post.create(
        author: @user, 
        title: 'Ruby on Rails',
        text: 'I like this framework, it works with everything you need to manage your website', 
        likes_counter: 0, 
        comments_counter: 0
    )
    @first_post.save!

    @second_post = Post.create(
        author: @user, 
        title: 'Javascript is a powerful language',
        text: 'Add a comment to explain experience with Javascript :)', 
        likes_counter: 0, 
        comments_counter: 0
    )
    @second_post.save!

    @third_post = Post.create(
        author: @user, 
        title: 'Ruby on Rails',
        text: 'I like this framework, it works with everything you need to manage your ', 
        likes_counter: 0, 
        comments_counter: 0
    )
    @third_post.save!

    @fourth_post = Post.create(
        author: @user, 
        title: 'Post number four',
        text: 'Fourth post', 
        likes_counter: 0, 
        comments_counter: 0
    )
    @fourth_post.save!

    @comment_one = Comment.create(author: @user, post: @second_post, text: 'Hello Fredo')
    @comment_one.save!
    @comment_two = Comment.create(author: @user, post: @second_post, text: 'Are you ok ?')
    @comment_two.save!
    @comment_three = Comment.create(author: @user, post: @first_post, text: 'What a great post')
    @comment_three.save!
    @comment_four = Comment.create(author: @user, post: @first_post, text: 'OOO you are right !')
    @comment_four.save!
    @comment_five = Comment.create(author: @user, post: @first_post, text: 'Cool post')
    @comment_five.save!
      visit user_posts_path(@user)
    end

    it "renders user's profile picture" do
      find("img[src='#{@user.photo}']")
    end

    it "renders the user's username" do
      expect(page).to have_content(@user.name)
    end

    it "renders the user's post count" do
      expect(page).to have_content(@user.number_of_post )
    end

    it "renders the user's posts" do
      expect(page).to have_content(@fourth_post.title)
      expect(page).to have_content(@second_post.title)
      expect(page).to have_content(@third_post.title)
    end

    it "renders some of the post's body" do
      expect(page).to have_content(@fourth_post.text[0, 50])
      expect(page).to have_content(@second_post.text[0, 50])
      expect(page).to have_content(@third_post.text[0, 50])
    end

    it 'renders first comments on a post' do
      expect(page).to have_content(@comment_one.text)
      expect(page).to have_content(@comment_two.text)
    end

    it 'renders comments count of a post' do
      expect(page).to have_content(@fourth_post.comments_counter)
      expect(page).to have_content(@second_post.comments_counter)
      expect(page).to have_content(@third_post.comments_counter)
    end

    it 'renders likes count of a post' do
      expect(page).to have_content(@fourth_post.likes_counter)
      expect(page).to have_content(@second_post.likes_counter)
      expect(page).to have_content(@third_post.likes_counter)
    end

    it "redirects to a specific post's show page" do
    click_link @second_post.title
      expect(page).to have_current_path(user_post_path(@user, @second_post))
    end
  end

  describe 'show page' do
    before(:example) do
    @user = User.create(
        name: 'Fredo', 
        photo: 'https://th.bing.com/th/id/R.7bef3acf80b4711c6de8115d2d775498?rik=oKsNFA%2flG5lGXg&riu=http%3a%2f%2fkrewfirm.files.wordpress.com%2f2010%2f07%2f2009_diary_of_a_tired_black_man_001.jpg&ehk=5HEpTg0xdXCQ3SvDtF%2brKjSoVdmZdczBl85tRTCsBks%3d&risl=&pid=ImgRaw&r=0',
        bio: 'Full-Stack Dev', 
        number_of_post: 0,
        email: 'fredo90@gmail.com',
        password: '123456',
        number_of_post:0
    )
    @user.save!

    @second_user = User.create(
        name: 'Fredo', 
        photo: 'https://th.bing.com/th/id/R.7bef3acf80b4711c6de8115d2d775498?rik=oKsNFA%2flG5lGXg&riu=http%3a%2f%2fkrewfirm.files.wordpress.com%2f2010%2f07%2f2009_diary_of_a_tired_black_man_001.jpg&ehk=5HEpTg0xdXCQ3SvDtF%2brKjSoVdmZdczBl85tRTCsBks%3d&risl=&pid=ImgRaw&r=0',
        bio: 'Full-Stack Dev', 
        number_of_post: 0,
        email: 'fredo604@gmail.com',
        password: '123456',
        number_of_post:0
    )
    @second_user.save!

      @post_model = Post.create(
        author: @user, 
        title: 'Hello World', 
        text: 'Programming is fun', 
        likes_counter: 0,
        comments_counter: 0
      )
      @comment_one = Comment.create(
        author: @second_user, 
        post: @post_model, 
        text: 'Hello'
      )
      @comment_one.save!

      @comment_two = Comment.create(
        author: @second_user, 
        post: @post_model, 
        text: "Waw"
      )
      @comment_two.save!

      @comment_three = Comment.create(
        author: @second_user, 
        post: @post_model, 
        text: 'Amazing'
      )
      @comment_three.save!

      visit user_post_path(@user, @post_model)
    end

    it 'renders the title' do
      expect(page).to have_content(@post_model.title)
    end

    it 'renders the author' do
      expect(page).to have_content(@user.name)
    end

    it 'renders comments count' do
      expect(page).to have_content(@post_model.comments_counter)
    end

    it 'renders likes count' do
      expect(page).to have_content(@post_model.likes_counter)
    end

    it 'renders the body' do
      expect(page).to have_content(@post_model.text)
    end

    it 'renders each commenter\'s username' do
      expect(page).to have_content(@second_user.name)
      expect(page).to have_content(@user.name)
    end

    it 'renders all comments' do
      expect(page).to have_content(@comment_one.author.name)
      expect(page).to have_content(@comment_two.author.name)
      expect(page).to have_content(@comment_three.author.name)
    end
  end
end