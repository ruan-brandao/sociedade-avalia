require 'spec_helper'

RSpec.describe PoliticianLike, :type => :model do
  it { should belong_to(:liker).class_name('User') }
  it { should belong_to(:liked).class_name('User') }

  it { should validate_presence_of(:liker_id) }
  it { should validate_presence_of(:liked_id) }
end
