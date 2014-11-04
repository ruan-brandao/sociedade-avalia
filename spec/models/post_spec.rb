require 'spec_helper'

describe Post do
	post = FactoryGirl.create(:post)

	it { should belong_to(:user) }
  it { should have_many(:post_likes) }

	it { should respond_to(:user_id) }

  it { should validate_presence_of(:content) }
end
