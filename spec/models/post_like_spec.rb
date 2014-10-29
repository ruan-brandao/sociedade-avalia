require 'spec_helper'

RSpec.describe PostLike, :type => :model do
	it { should belong_to(:post) }
	it { should belong_to(:user) }

	it { should validate_presence_of(:post_id) }
	it { should validate_presence_of(:user_id) }
	it { should validate_presence_of(:value) }
end