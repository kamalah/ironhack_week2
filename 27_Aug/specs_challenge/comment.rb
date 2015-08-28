class Comment
	attr_reader :spamornot
	def initialize (var1, var2, var3)
		@name = var1
		@comment = var2
		@spamornot = var3 

	end

	def check_for_spam
		@spamornot = @comment.scan("http://").length == 2
	end

	def show_comment
		"#{@name} #{@comment} #{@spamornot}"
	end
	
end
