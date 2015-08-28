class CommentList
	def initialize
		@comment_array = []
	end
	
	def show_array
		if @comment_array.empty?
			""
		else
			@comment_array.each {|comment| puts comment}
		end
	end

	def add_comment_string(comment_string)
		@comment_array.push(comment_string)
		@comment_array.last
	end

	def add_comment_object(comment)
		@comment_array.push(comment)
		@comment_array.last
	end

	def add_spam_comment(comment)
		for
	end
end