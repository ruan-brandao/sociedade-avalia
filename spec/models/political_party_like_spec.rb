require 'spec_helper'

RSpec.describe PoliticalPartyLike, :type => :model do
  it { should belong_to(:user) }
  it { should belong_to(:political_party) }

  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:political_party_id) }
end
