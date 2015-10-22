class Post < ActiveRecord::Base
	belongs_to :user
	has_many :taggings
	has_many :tags, through: :taggings
	before_create :adjust_url

	validates :tags, presence: true, length: { maximum: 50 }

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

	def adjust_url
		if !self.url.blank?
			self.url.gsub!(/http:/, 'https:')
		else
			self.image.url.gsub!(/http:/, 'https:')
		end
	end

	# TAG FUNCTIONS

	def self.tagged_with(name)
		tag = Tag.find_by_name(name)
		return tag.blank? ? nil : tag.posts.reverse
	end

	def self.tagged_with_multiple(names)
		all_posts = Array.new

		# Creates a regex string to use in where query to get multiple tag models
		# that are LIKE the passed in strings
		regex_string = ''
		names.each_with_index do |name, index|
			if index == 0
				regex_string += name
			else
				regex_string += ('|' + name)
			end
		end

		# Goes through the tag models and adds each post to the array of all posts,
		# iff the post has not already been added to all_posts
		regex_type = Rails.env.development? ? "REGEXP" : "~*"
		Tag.where("name " +regex_type+ " ?", regex_string).each do |tag|
			tag.posts.each do |post|
				all_posts << post unless all_posts.include?(post)
			end
		end

		return all_posts
	end

	def self.tag_counts
		tags = Tag.select("tags.id, tags.name, count(taggings.tag_id) as count").
			     joins(:taggings).group("taggings.tag_id, tags.id, tags.name")
		return tags.blank? ? [] : tags
	end

	def tag_list
		tags.map(&:name).join(", ")
	end

	def tag_list=(names)
		self.tags = names.split(",").map do |n|
			Tag.where(name: n.strip.downcase).first_or_create!
		end
	end

	# SEARCH

	def self.search(search_string)
		return [] if search_string.blank?
		search_queries = search_string.split
		self.tagged_with_multiple(search_queries)
	end

end
