class Post < ActiveRecord::Base
	belongs_to :user
	VALID_URL_REGEX = /\A[\w+\-.:\/]+\.[\w+\-.]+[\/\w+-.]*\/[\w+\-.]+.(jpg|jpeg|png|gif)\z/i
	validates :url, presence: true, format: { with: VALID_URL_REGEX }
	validates :description, length: { maximum: 150 }
end
