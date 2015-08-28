require 'sinatra'
require 'sinatra/reloader'
require_relative './lib/random_phrase.rb'
require 'pry'

set :port, 3000

random_phrases = RandomPhrase.new
show_hide = false

get "/" do
	@phrase= random_phrases.get_random_phrase
	@random_phrases = random_phrases
	@show_hide = show_hide
	erb :index
end

post "/add_phrase" do
	random_phrases.add_phrase(params[:phrase])
	redirect to("/")
end

get "/show_hide" do
	show_hide = !show_hide
	redirect to ("/")
end

post "/remove_phrase" do
	
	if !params.empty?
		random_phrases.remove_phrase(params[:checkbox][0].to_i)
	end
	redirect to ("/")
end
