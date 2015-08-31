require "rspec"
require_relative "../imdb_search.rb"


RSpec.describe MovieSearch do
	before ":all" do
		@movie = Array.new(13) {instance_double("Movie", :poster=>"jpg")}
		@movie[0] = instance_double("Movie", :poster=>nil)
		@movie[3] = instance_double("Movie", :poster=>nil)
		@movie[5] = instance_double("Movie", :poster=>nil)
	end

	it "makes sure no movies without posters are included in list" do
		new_search =MovieSearch.new
		new_search.movie_array = @movie
		new_search.get_movies_with_posters
		poster_lis
		expect(new_search.movies_with_posters.include?(nil)).to be_falsey
	end

	# it "Makes sure that there are always 9 posters" do
	# end
  
end