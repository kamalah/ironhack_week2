class FileCounter
	def initialize(file_name)
	@file_name = file_name
	end

	def count_words
		file_content = @file_name.read
		file_content.split.length
	end
end