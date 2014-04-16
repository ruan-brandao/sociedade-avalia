require 'spec_helper'

describe Post do
  it { should validate_presence_of(:content) }
  it { should validate_numericality_of(:likes) }
  it { should validate_numericality_of(:dislikes) }
end
