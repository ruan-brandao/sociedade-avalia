class PoliticalParty < ActiveRecord::Base
	has_many :users
	has_many :political_party_likes

	validates :name, :siglum, :number, :position, presence: true
	validates :siglum, length: { maximum: 10 }
	validates :number, numericality: { only_integer: true, greater_than: 0, less_than: 100 }

	def likes
		PoliticalPartyLike.where(political_party_id: self.id, value:true).count
	end

	def dislikes
		self.political_party_likes.count -  PoliticalPartyLike.where(political_party_id: self.id, value:true).count
	end
end
