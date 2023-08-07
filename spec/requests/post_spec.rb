require_relative '../rails_helper'

RSpec.describe PostsController, type: :controller do
  before :each do
    @user = User.create(name: 'Fredo', number_of_post: 0, email: 'fred@example.com', password: '123456', id:105)
    @post = @user.posts.create(title: 'Post 1', comments_counter: 0, likes_counter: 0)
    @user.save!
    @post.author_id = @user.id
    @post.save!
  end
    describe 'GET /users/:id/posts/' do
        it 'has a 200 status code' do
            get :index, params: { user_id: @user.id }
            expect(response).to have_http_status(200)
        end
        it 'renders the right template for Posts' do
            get :index, params: { user_id: @user.id }
            expect(response.body).to render_template(:index)
        end
    end

    describe 'GET /@users/:id/posts/:id' do
        it 'has a 200 status code' do
        get :show, params: { user_id: @user.id, id: @post.id }
        expect(response).to have_http_status(200)
        end
        it 'renders the right template for Posts' do
        get :show, params: { user_id: @user.id, id: @post.id }
        expect(response).to render_template(:show)
        end
    end
end