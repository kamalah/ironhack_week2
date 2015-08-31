require 'sinatra'
require 'sinatra/reloader'
require 'pry'

require_relative './lib/ruby_files/imdb_search.rb'
require_relative './lib/ruby_files/movie_test.rb'

my_search = MovieSearch.new
movie_test = MovieTest.new

get "/" do
	erb :index
end

post "/search" do
	search = params[:search_word]
	my_search.find_movie(search)
	my_search.get_movies_with_posters
	redirect to ("/results")
end

post "/random" do
	my_search.get_random_movies
	redirect to ("/results")
end

get "/results" do
	@movie_posters = my_search.movies_with_posters
	@search = my_search.search_word
	movie_test.build_test(@movie_posters)
	erb :results
end

get "/test" do
	@search = my_search.search_word
	@movie_posters = my_search.movies_with_posters
	@question = movie_test.get_next_question
	if @question.nil?
		"No more questions. You got #{movie_test.grade} correct."
	else
		erb :test
	end
end

post "/grade" do
	if params[:answer]== "true"
		movie_test.grade += 1
	end
	redirect to ("/test")
end
