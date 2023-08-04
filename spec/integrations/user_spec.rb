require_relative '../rails_helper'

RSpec.describe 'Users', type: :system, js: true do
  describe 'first page' do
    before(:example) do
      @user = User.create(
        name: 'Fredo', 
        photo: 'https://th.bing.com/th/id/R.7bef3acf80b4711c6de8115d2d775498?rik=oKsNFA%2flG5lGXg&riu=http%3a%2f%2fkrewfirm.files.wordpress.com%2f2010%2f07%2f2009_diary_of_a_tired_black_man_001.jpg&ehk=5HEpTg0xdXCQ3SvDtF%2brKjSoVdmZdczBl85tRTCsBks%3d&risl=&pid=ImgRaw&r=0',
        bio: 'Full-Stack Dev', 
        number_of_post: 0,
        email: 'fredo509@gmail.com',
        password: '123456'
    )
      visit users_path
    end

    it 'renders the list of users' do
      expect(page).to have_content(@user.name)
    end

    it "renders user's profile picture" do
      find("img[src='#{@user.photo}']")
    end

    it 'renders the number of posts for each user' do
      expect(page).to have_content(@user.number_of_post)
    end

    it "redirects to the user's show page" do
      click_link @user.name
      expect(page).to have_current_path(user_path(@user))
    end
  end

  describe 'show page' do
    before(:example) do
      @user = User.create(
        name: 'Fredo',
        photo: 'https://th.bing.com/th/id/R.7bef3acf80b4711c6de8115d2d775498?rik=oKsNFA%2flG5lGXg&riu=http%3a%2f%2fkrewfirm.files.wordpress.com%2f2010%2f07%2f2009_diary_of_a_tired_black_man_001.jpg&ehk=5HEpTg0xdXCQ3SvDtF%2brKjSoVdmZdczBl85tRTCsBks%3d&risl=&pid=ImgRaw&r=0',
        bio: 'Awesome dev.',
        number_of_post: 0,
        email: 'fredo09@gmail.com',
        password: '123456'
    )
    @user.save!

      @first_post = Post.create(
        author: @user, 
        title: 'Hello World', 
        text: 'End of the world', 
        likes_counter: 0,
        comments_counter: 0
    )
    @first_post.save!

    @second_post = Post.create(
        author: @user, 
        title: 'Hello Moon', 
        text: 'Life is good', 
        likes_counter: 0,
        comments_counter: 0
    )
    @second_post.save!

    @third_post = Post.create(
        author: @user, 
        title: 'Black man in the wild',  
        text: 'this is a amazing',
        likes_counter: 0, 
        comments_counter: 0
    )
    @third_post.save!

      visit user_path(@user)
    end

    it "renders user's profile picture" do
      find("img[src='#{@user.photo}']")
    end

    it "renders the user's username" do
      expect(page).to have_content(@user.name)
    end

    it "renders the user's post count" do
      expect(page).to have_content(@user.number_of_post)
    end

    it "renders the user's bio" do
      expect(page).to have_content(@user.bio)
    end

    it "renders the user's last 3 posts" do
      expect(page).to have_content(@first_post.title)
      expect(page).to have_content(@second_post.title)
      expect(page).to have_content(@third_post.title)
    end

    it "redirects to user's posts page" do
      click_link @first_post.title
      expect(page).to have_current_path(user_post_path(@user, @first_post))
    end
  end
end