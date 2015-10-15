# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users_list = [
	"Foo",
	"Bar",
	"Baz",
	"Qux"
]

posts_list = [
	"https://i.imgur.com/z1cTewU.jpg",
	"https://farm1.staticflickr.com/646/21909119648_ab4ecd12dc_b.jpg",
	"http://www.nasa.gov/sites/default/files/thumbnails/image/iss045e048728.jpg",
	"https://i.imgur.com/fKybihn.jpg",
	"https://i.imgur.com/I0wEdOc.jpg",
	"https://i.imgur.com/QAdo5Nn.jpg",
	"http://www.nasa.gov/centers/goddard/images/content/192871main_science_cover_LEISA_JPG.jpg",
	"https://farm6.staticflickr.com/5648/21302980354_80e54eece6_b.jpg"
]

users_list.each_with_index do |username, user_index|
	user = User.new
	user.name = username
	user.password_digest = "$2a$10$pL7E8Znpw7xfbK/43EXI0um/RKZvXrDyperHALIbEKlCQrQHAhjQC"
	user.save!

	tag = Tag.first_or_create!(name: "space")

	posts_list.each_with_index do |post_url, index|
		next unless index%4 == user_index
		post = Post.new
		post.url = posts_list[index]
		post.user = user

		tagging = Tagging.new
		tagging.tag = tag
		tagging.post = post
		tagging.save!

		post.tags << tag
		post.save!
	end
end
