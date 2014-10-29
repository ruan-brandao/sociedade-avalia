require 'spec_helper'

describe Post do
	post = FactoryGirl.create(:post)

	it { should belong_to(:user) }
  it { should have_many(:post_likes) }

	it { should respond_to(:user_id) }

  it { should validate_presence_of(:content) }
  it { should validate_numericality_of(:likes) }
  it { should validate_numericality_of(:dislikes) }

  it 'has no likes' do
  	post.likes.should eq(0)
  end

  it 'has no dislikes' do
  	post.dislikes.should eq(0)
  end

  it 'should not have a negative number of likes' do
  	@post = FactoryGirl.build(:post, likes: -5)
  	@post.should_not be_valid
  end

  it 'should not have a negative number of dislikes' do
  	@post = FactoryGirl.build(:post, dislikes: -5)
  	@post.should_not be_valid
  end
end
