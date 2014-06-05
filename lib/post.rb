class Post

	attr_reader :title,:text, :date,:user

	def initialize *params
		@title = params[0]
		@text = params[1]
		@date = params[2]
		@user = params[3]
	 

end
