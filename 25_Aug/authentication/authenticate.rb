require 'sinatra'
require 'sinatra/reloader'
require 'pry'

enable :sessions

un_pwd = {"kamalah" => "1234", "joe" => "1020"}

get "/" do 
	if session[:valid] 
		@user = session[:user]
		erb :home 
	else
		erb :index
	end	
end

post "/check" do
	username = params[:user]
	password = params[:password]
	session[:valid] = un_pwd[username.downcase] == password
	session[:user] = username
	redirect to ("/status")
end

get "/status" do
	if session[:valid]
		erb :logged_in
	else
		@invalid = true
		erb :index
	end
end

get "/log_out" do
	session[:valid] = false
	redirect to ("/")
end