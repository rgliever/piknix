module ApplicationHelper
	
	def tag_cloud(tags)
		sorted_tags = tags.sort_by(&:count).reverse
		num_tags = sorted_tags.length > 6 ? 6 : sorted_tags.length
		popular_list = sorted_tags[0..num_tags-1]
		popular_list.each do |tag|
			yield(tag)
		end
	end

end
