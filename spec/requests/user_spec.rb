require 'rails_helper'
require 'spec_helper'

RSpec.describe 'Users', type: :request do
  before :each do
    @user = User.new(
      id: 200,
      name: 'Toma',
      photo: 'http://great.com/org.pjg',
      bio: 'Full-stack developer',
      number_of_post: 0,
      email: 'Fredo@great.com',
      password:'123456'
    )
    @user.save!
  end

  describe 'GET /index' do
    it 'renders index template' do
      get '/users/'
      expect(response.status).to eq(200)
      expect(response).to render_template('index')
    end
  end

  describe 'GET /show' do
    it 'renders the show template' do
      get "/users/#{@user.id}"
      expect(response.status).to eq(200)
      expect(response).to render_template('users/show')
    end
  end
end

RSpec.describe "Users", type: :request do
  before :each do
    @user = User.new(
      id: 200,
      name: 'Toma',
      photo: 'http://great.com/org.pjg',
      bio: 'Full-stack developer',
      number_of_post: 0,
      email: 'Fredo@great.com',
      password:'123456'
    )
    @user.save!
  end

  describe "GET /index" do
    it "returns http success" do
      get "/users/#{@user.id}"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/users/#{@user.id}"
      expect(response).to have_http_status(:success)
    end
  end

end