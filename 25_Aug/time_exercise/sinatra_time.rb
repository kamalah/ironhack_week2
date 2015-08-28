require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require_relative './lib/fixnum.rb'

get "/time/:dir/:hours" do
	# case params[:dir]
	# 	when "before"
	# 		time = Time.now - (params[:hours].to_i * 60 * 60)
	# 	when "after"
	# 		time = 	Time.now + (params[:hours].to_i* 60 * 60)	
	# end
	
	hour_num = params[:hours].to_i
	direction = params[:dir]
	time = hour_num.hours.send(direction)
	@show_time = "The time #{params[:hours]} hours #{params[:dir]} now is #{time.strftime("%I:%M%p")}"
	erb :time
end

