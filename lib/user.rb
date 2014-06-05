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
	end

	def find_post_by_title title 
	end
end
