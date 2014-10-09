class PoliticalParty < ActiveRecord::Base
	has_many :users

	validates :name, :siglum, :number, :position, presence: true
	validates :siglum, length: { maximum: 10 }
	validates :number, numericality: { only_integer: true, greater_than: 0, less_than: 100 }
end
