require_relative '../rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Fredo St Fleur', number_of_post: 0, email: "fred@02gmail.com", password: '123456') }

  before { subject.save }

  it 'title should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'title should be John Doe' do
    expect(subject.name).to eq('Fredo St Fleur')
  end

  it 'posts counter should be present' do
    subject.number_of_post = nil
    expect(subject).to_not be_valid
  end

  it 'posts counter should be greater than or equal to 0' do
    subject.number_of_post = -1
    expect(subject).to_not be_valid
  end

  it 'should return the 3 most recent posts for a given user' do
    @user = User.create(id: 40, name: 'Fredo St Fleur', number_of_post: 3, email: "fred@gmail.com", password: '123456')
    5.times do
      post = @user.posts.build(title: "I love my life", comments_counter: 0, likes_counter: 0)
      post.author_id = @user.id
      @user.save!
      post.save!
    end
    expect(@user.recent_posts.length).to eq(3)
  end
end