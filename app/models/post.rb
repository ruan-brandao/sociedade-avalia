class Post < ActiveRecord::Base

	validates :content, presence: true
	validates :likes, numericality: true
	validates :dislikes, numericality: true
end
