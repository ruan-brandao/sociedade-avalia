require 'spec_helper'

RSpec.describe PoliticalParty, :type => :model do
  it { should have_many(:users) }
end
