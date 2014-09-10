require 'spec_helper'

RSpec.describe Relationship, :type => :model do
	let(:follower) { FactoryGirl.build(:user, id: 1) }
  let(:followed) { FactoryGirl.build(:user, id: 2) }
  let(:relationship) { follower.relationships.build(followed_id: followed.id) }

  subject { relationship }

  it { should be_valid }

  it { should belong_to(:follower).class_name('User') }
  it { should belong_to(:followed).class_name('User') }

  it { should validate_presence_of(:follower_id) }
  it { should validate_presence_of(:followed_id) }
end
