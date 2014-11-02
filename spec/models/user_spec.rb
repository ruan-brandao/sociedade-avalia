require 'spec_helper'

describe User do
	let(:user) { FactoryGirl.create(:user) }

  it { should have_many(:posts) }
  it { should have_many(:followers) }
  it { should have_many(:followed_users) }
  it { should have_many(:post_likes) }
  it { should have_many(:political_party_likes) }

  it { should respond_to(:full_name) }
  it { should respond_to(:feed) }
  it { should respond_to(:relationships) }
  it { should respond_to(:reverse_relationships) }
  it { should respond_to(:following?) }
  it { should respond_to(:follow!) }
  it { should respond_to(:politician?) }
  it { should respond_to(:admin?) }

  describe "following" do
    let(:other_user) { FactoryGirl.create(:user, username: 'other') }
    before do
      user.save
      user.follow!(other_user)
    end

    it 'is following other user after follow'do
      expect(user).to be_following(other_user)
    end

    it 'has other user included in its followed_users' do
      expect(user.followed_users).to include(other_user)
    end

    describe "followed user" do
      it 'has user included in its followers' do
        expect(other_user.followers).to include(user)
      end
    end

    describe "and unfollowing" do
      before { user.unfollow!(other_user) }

      it 'is not following other user after unfollow' do
        expect(user).to_not be_following(other_user)
      end

      it 'does not have other user included in its followed_users' do
        expect(user.followed_users).to_not include(other_user)
      end
    end
  end

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
  it { should_not validate_presence_of(:political_party_id) }

  it { should have_attached_file(:profile_picture) }
  it { should validate_attachment_content_type(:profile_picture).
                allowing('image/png', 'image/gif').
                rejecting('text/plain', 'text/xml') }
  it { should validate_attachment_size(:profile_picture).less_than(1.megabytes) }

end
