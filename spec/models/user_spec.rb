require 'spec_helper'

DatabaseCleaner.strategy = :truncation

describe User do
	user = FactoryGirl.build(:user)

  it { should have_many(:posts) }
  it { should have_many(:followers) }
  it { should have_many(:followed_users) }

  it { should respond_to(:full_name) }

  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:birth_date) }
  it { should validate_presence_of(:gender) }
  it { should validate_inclusion_of(:gender).in_array(%w(male female other)) }
  it { should validate_presence_of(:username) }
  it { should validate_uniqueness_of(:username) }
  it { should validate_inclusion_of(:state).in_array(%w(AC AL AP AM BA CE DF ES GO 
                                        								MA MT MS MG PA PB PR PE PI
                                        								RJ RN RS RO RR SC SP SE TO)) }
  it { should_not validate_presence_of(:state) }
  it { should_not validate_presence_of(:city) }

  it { should have_attached_file(:profile_picture) }
  it { should validate_attachment_content_type(:profile_picture).
                allowing('image/png', 'image/gif').
                rejecting('text/plain', 'text/xml') }
  it { should validate_attachment_size(:profile_picture).less_than(1.megabytes) }

end
