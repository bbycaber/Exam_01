class User

	attr_reader :name,:posts

	def initialize name
		@name = name
		@posts = []
	end

	def add_post title,text,date
		post = Post.new(title,text,date,self)
		@posts.push(post)
	end

	def list
		array_post = []
		@posts.each{|post| array_post << post.display_entry }
		array_post
	end

	def find_post_by_title title 
		posts.select{|post| post.title == title}.first
	end

	def tag_clod
		tags2 = tags.uniq
		cant = []
		tags.each{|x|}
	end
end
