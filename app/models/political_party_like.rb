class PoliticalPartyLike < ActiveRecord::Base
	belongs_to :user
	belongs_to :political_party

	validates :user_id, presence: true
	validates :political_party_id, presence: true
end
