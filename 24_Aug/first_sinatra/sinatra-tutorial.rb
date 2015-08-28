require 'sinatra'
require 'sinatra/reloader'
require_relative './lib/filecounter.rb'

set :port, 3000

get '/' do
  	erb :index
 end

post "/greetings" do
    	"Hello #{params[:my_name]}!"
    end

get "/what_time" do
 	@current_time = DateTime.now.strftime("It is %A, %B %d %Y at %I:%M%p")
    erb:time 
 end

get "/hi" do
	"Thanks for saying hi"
end

get "/upload_file" do
	erb :upload_file
end

post "/show_file" do
	tempfile = params[:file][:tempfile]
	file_count = FileCounter.new(tempfile)
	@num_words = file_count.count_words
	"Number of words: #{@num_words}"
end


get "/jquery" do


end