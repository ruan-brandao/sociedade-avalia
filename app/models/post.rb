class Post < ActiveRecord::Base
	belongs_to :user

	validates :content, presence: true
	validates :likes, numericality: true
	validates :dislikes, numericality: true
end
