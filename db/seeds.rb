# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

posts_list = [
	[ # SPACE
		"https://i.imgur.com/z1cTewU.jpg",
		"https://farm1.staticflickr.com/646/21909119648_ab4ecd12dc_b.jpg",
		"http://www.nasa.gov/sites/default/files/thumbnails/image/iss045e048728.jpg",
		"https://i.imgur.com/fKybihn.jpg",
		"https://i.imgur.com/I0wEdOc.jpg",
		"https://i.imgur.com/QAdo5Nn.jpg",
		"http://www.nasa.gov/centers/goddard/images/content/192871main_science_cover_LEISA_JPG.jpg",
		"https://farm6.staticflickr.com/5648/21302980354_80e54eece6_b.jpg"
	],
	[ # FOREST
		"https://twistedsifter.files.wordpress.com/2014/04/forest-jyvaskyla-finland.jpg",
		"http://i.imgur.com/2tQoKAI.jpg",
		"http://freebigpictures.com/wp-content/uploads/2009/09/coniferous-forest.jpg",
		"http://i.imgur.com/tdKm6nR.jpg",
		"http://i.imgur.com/LgYGoln.jpg",
		"http://i.imgur.com/mTyEsQf.jpg",
		"http://i.imgur.com/oEfs9.jpg",
		"http://i.imgur.com/brE8A.jpg"
	],
	[ # MOVIES
		"http://i.imgur.com/bVxmgtd.jpg",
		"http://i.imgur.com/nUgFIp2.jpg",
		"http://i.imgur.com/UHt95S1.jpg",
		"http://i.imgur.com/FcrtVMz.jpg",
		"http://i.imgur.com/nlCc1xm.jpg",
		"http://i.imgur.com/t6QDoVD.jpg",
		"http://i.imgur.com/BqRaWOY.jpg",
		"http://i.imgur.com/Vqy9bjr.jpg",
		"http://i.imgur.com/N44Qk3w.jpg"
	],
	[ # AUTUMN
		"https://farm6.staticflickr.com/5834/21950573679_5f1975dcc4_b.jpg",
		"https://i.imgur.com/iUkPHtL.jpg",
		"https://i.imgur.com/TlyjghJ.jpg",
		"https://i.imgur.com/WZuVVM5.jpg",
		"https://i.imgur.com/m9TgQDm.jpg",
		"http://static1.squarespace.com/static/550c57cde4b03b2ca7f13789/55109c0be4b0ce165ed78a0a/55109c58e4b0ce924f038db6/1427244764296/snake+road--2.jpg",
		"https://i.imgur.com/WnPrfPt.jpg",
		"https://i.imgur.com/r6O208I.jpg"
	],
	[ # WINTER
		"https://c1.staticflickr.com/9/8608/16101077266_3bbf4d5761_k.jpg",
		"https://c1.staticflickr.com/9/8089/8426838331_1ec70718ba_k.jpg",
		"https://c2.staticflickr.com/8/7310/13226495674_2119c28c08_k.jpg",
		"https://c2.staticflickr.com/4/3792/10398871265_d50f555873_b.jpg",
		"https://c1.staticflickr.com/1/690/22034939231_e929eb9f08_h.jpg",
		"https://c2.staticflickr.com/8/7493/16167174901_647b064d7a_b.jpg",
		"https://farm8.staticflickr.com/7621/16842970446_3eb4389ec7_k.jpg"
	],
	[ # ANIMAL
		"https://i.imgur.com/45Py5kO.jpg",
		"https://farm1.staticflickr.com/763/21919639950_53ebf6dd9a_k.jpg",
		"https://i.imgur.com/vsG901N.jpg",
		"https://c2.staticflickr.com/6/5647/22076939865_b91885019e_k.jpg",
		"http://c2.staticflickr.com/6/5627/22061242362_e20ca5917f_h.jpg",
		"https://farm6.staticflickr.com/5739/21421677204_bd669c5a08_b.jpg",
		"https://i.imgur.com/WlmYsQd.jpg",
		"https://farm6.staticflickr.com/5732/21824085308_c41e9c1260_b.jpg",
		"https://farm1.staticflickr.com/585/21781110559_ea2c1c8567_b.jpg"
	]
]

users_list = [
	["Foo", "space",  posts_list[0]],
	["Bar", "forest", posts_list[1]],
	["Baz", "movies", posts_list[2]],
	["Qux", "autumn", posts_list[3]],
	["Jon", "winter", posts_list[4]],
	["Pod", "animal", posts_list[5]]
]

# Create all users and the posts for each user
$all_posts = []
users_list.each do |username, tagname, urls|
	user = User.new
	user.name = username
	user.password_digest = "$2a$10$pL7E8Znpw7xfbK/43EXI0um/RKZvXrDyperHALIbEKlCQrQHAhjQC" # 'password'
	user.save!
	tag = Tag.create!(name: tagname)

	urls.each do |url|
		post = Post.new
		post.url = url
		post.user = user
		tagging = Tagging.new
		tagging.tag = tag
		tagging.post = post
		tagging.save!
		post.tags << tag
		$all_posts << post
	end
end

$all_posts.shuffle.each do |post|
	post.save!
end
