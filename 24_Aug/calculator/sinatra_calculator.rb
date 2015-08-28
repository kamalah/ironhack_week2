require 'sinatra'
require 'sinatra/reloader'
require_relative './lib/calculator.rb'
require 'pry'

new_calculator = Calculator.new
rcnum = nil

get "/" do
	erb :index
end

post "/result" do
	@rcnum = new_calculator.recall
	num1 = @rcnum.nil? ? params[:num1].to_i : @rcnum 
	num2 = params[:num2].to_i
	operation = params[:operation]
	
	# case params[:operation]
	# 	when "+"
	# 		result = new_calculator.add(params[:num1].to_i, params[:num2].to_i)		 
	# 	when "-"
	# 		result = new_calculator.subtract(params[:num1].to_i, params[:num2].to_i)
	# 	when "*"		
	# 		result = new_calculator.multiply(params[:num1].to_i, params[:num2].to_i)	
	# 	when "/"
	# 		result = new_calculator.divide(params[:num1].to_i, params[:num2].to_i)
	# end
	case operation
		when "RC"
			new_calculator.read_num
		when "CL"
			new_calculator.clear
		else
			@result = num1.send(operation, num2)
			@result_string = "#{num1}  #{operation} #{num2} = " + @result.to_s
	end
	@rcnum = new_calculator.recall
	erb :index
end

post "/store" do
	new_calculator.save(params[:result])
	redirect to ("/")
end