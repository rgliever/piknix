module ApplicationHelper
	
	def tag_cloud(tags)
		popular_list = tags.sort_by(&:count).reverse[0..5]
		popular_list.each do |tag|
			yield(tag)
		end
	end

end
