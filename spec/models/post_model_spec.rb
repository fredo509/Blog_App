require_relative '../rails_helper'

RSpec.describe Post, type: :model do
  subject { Post.new(title: 'Rails is amazing') }

  it 'validates presence of title' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'title should be My first post' do
    expect(subject.title).to eq('Rails is amazing')
  end

  it 'validates length of title' do
    subject.title = 'a' * 251
    expect(subject).to_not be_valid
  end

  it 'validates numericality of comments_counter' do
    subject.comments_counter = -1
    expect(subject).to_not be_valid
  end

  it 'validates numericality of likes_counter' do
    subject.likes_counter = -1
    expect(subject).to_not be_valid
  end
end