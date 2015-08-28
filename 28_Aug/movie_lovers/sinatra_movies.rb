require 'sinatra'
require 'sinatra/reloader'
require 'pry'

require_relative './lib/imdb_search.rb'
my_search = MovieSearch.new

get "/" do
	erb :index
end

post "/search" do
	search = params[:search_word]
	my_search.find_movie(search)
	redirect to ("/results")
end

get "/results" do
	my_search.get_movies_with_posters
	@movie_posters = my_search.movies_with_posters
	my_search.get_question
	@search = my_search.search_word
	@question = my_search.question
	erb :results
end
