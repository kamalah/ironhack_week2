require 'imdb'

class MovieSearch
	attr_accessor :movies_with_posters, :search_word, :question, :movie_array
	def initialize
		@movie_array = []
		@movies_with_posters = []
		@search_word =""
		@question = []
	end

	def find_movie(search_word)
		movie_search = Imdb::Search.new(search_word)
		@search_word = search_word
		@movie_array = movie_search.movies
	end

	def get_movies_with_posters
		#find first 9 movies with posters
		@movies_with_posters = []
		@movie_array.each do |movie|
			break if (@movies_with_posters.length > 8)

			if ! movie.poster.nil?
				@movies_with_posters << movie
		 	end
 	
		 end
	end

	def get_question
		@question = []
		check_year_made_question
		if @question.empty?
			check_director_question
		end
	end

	def check_year_made_question
		#check if "Was made it year has one answer"
		years = @movies_with_posters.map {|movie| movie.year}
		rand_index = rand(@movies_with_posters.length)
		question_year = years[rand_index]

		if years.count(question_year) == 1
			@question[0] = rand_index
			@question[1] = "Which movie was made in #{question_year}?"
		end
	end

	def check_director_question
		#check if "Was directed by has one answer"
		directors = @movies_with_posters.map {|movie| movie.director}
		rand_index = rand(@movies_with_posters.length)
		question_director = directors[rand_index]
		if directors.count == 1
			@question[0] = rand_index
			@question[1] = "Which movie was directed by {question_director}?"
		end
	end

end