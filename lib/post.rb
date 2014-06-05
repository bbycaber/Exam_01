class Post

	attr_reader :title,:text, :date,:user, :tags

	def initialize *params
	  if(params.size ==4)
		@title = params[0]
		@text = params[1]
		@date = params[2]
		@user = params[3]
		@tags = []
	 else
	 	post = load_file(params[0])
	 	@title = post.title
		@text = post.text
		@date = post.date
		@user = post.user
		@tags = post.tags
	
	  end
	end

	def summary
		var = ""
		@text.split(' ').take(10).each{|x| var = var=var + x + " "}
		var
	end

	def tagme *params
		params.each{|x| tags << x}
	end

	def same? tile,text,date
		@title ==title && @text ==text && @date ==date
	end

	def display_entry
		dommy = @user.name + ","+ @date + "\n" + @title + "\n" + @text + "\ntags:"
		@tags.each{|tag| dommy+= tag.to_s + "," }
		puts "#{dommy}"
		dommy

	end

	def save
		
		File.open  parameterize(@title) + ".yml", 'w' do |f|
            f.write YAML::dump self
        end
	end

	private 

	def load_file file
		YAML.load_file(file)
	end

	# parametrize
	def parameterize(string, sep = '-')
	  # replace accented chars with their ascii equivalents
	  parameterized_string = string.downcase
	  # Turn unwanted chars into the separator
	  parameterized_string.gsub!(/[^a-z0-9\-_]+/, sep)
	  unless sep.nil? || sep.empty?
	    re_sep = Regexp.escape(sep)
	    # No more than one of the separator in a row.
	    parameterized_string.gsub!(/#{re_sep}{2,}/, sep)
	    # Remove leading/trailing separator.
	    parameterized_string.gsub!(/^#{re_sep}|#{re_sep}$/, '')
	  end
	  parameterized_string.downcase
	end

end
