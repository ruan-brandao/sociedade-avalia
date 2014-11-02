require 'spec_helper'

RSpec.describe PoliticalParty, :type => :model do
  it { should have_many(:users) }
  it { should have_many(:political_party_likes) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:siglum) }
  it { should ensure_length_of(:siglum).is_at_most(10) }
  it { should validate_presence_of(:number) }
  it { should validate_presence_of(:position) }
  it { should validate_numericality_of(:number).only_integer }
  it { should validate_numericality_of(:number).is_greater_than(0) }
  it { should validate_numericality_of(:number).is_less_than(100) }
end
