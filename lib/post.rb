class Post

	attr_reader :title,:text, :date,:user

	def initialize *params
	  if(params.size ==4)
		@title = params[0]
		@text = params[1]
		@date = params[2]
		@user = params[3]
	 else
	 	post = load_file(params[0])
	 	@title = post.title
		@text = post.text
		@date = post.date
		@user = post.user
	
	  end
	end

	def summary
		var = ""
		@text.split(' ').take(10).each{|x| var = var=var + x + " "}
		var
	end

	def tagme
	end

	def same? tile,text,date
		@title ==title && @text ==text && @date ==date
	end

	private 

	def load_file file
		YAML.load_file(file)
	end

end
