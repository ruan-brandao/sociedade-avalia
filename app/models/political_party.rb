class PoliticalParty < ActiveRecord::Base
	has_many :users
	has_many :political_party_likes

	validates :name, :siglum, :number, :position, presence: true
	validates :siglum, length: { maximum: 10 }
	validates :number, numericality: { only_integer: true, greater_than: 0, less_than: 100 }

	has_attached_file :picture,
									  :styles => { :medium => "300x300>", 
										:thumb => "100x100>" }, 
										:default_url => "/images/:style/missing-party-picture.png"
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/
  validates_attachment_size :picture, less_than: 2.megabytes

	def likes
		PoliticalPartyLike.where(political_party_id: self.id, value:true).count
	end

	def dislikes
		self.political_party_likes.count -  self.likes
	end

	def total_likes_and_dislikes
		self.political_party_likes.count
	end
end
