class Post < ActiveRecord::Base
	validates :url, presence: true
	validates :description, length: { maximum: 150 }
end
