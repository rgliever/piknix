class Post < ActiveRecord::Base
	belongs_to :user

	validates :description, length: { maximum: 150 }

	VALID_URL_REGEX = /\A[\w+\-.:\/]+\.[\w+\-.]+[\/\w+-.]*\/[\w+\-.]+.(jpg|jpeg|png|gif|gifv)\z/i
	validates :url, format: { with: VALID_URL_REGEX }, allow_blank: true

	has_attached_file :image
	validates_attachment :image, size: { less_than: 5.megabytes },
		content_type: { content_type: ["image/jpg", "image/jpeg", 
			                             "image/png", "image/gif", "image/gifv"] }

	validate :url_xor_attachment

	# checks iff one of url or image fields are filled out
	def url_xor_attachment
		if url.blank? and image.blank?
			errors.add(:base, "Both image fields are blank")
			return false
		elsif (!url.blank? and !image.blank?)
			errors.add(:base, "Both image fields are filled")
			return false
		else
			return true
		end	
	end

end
