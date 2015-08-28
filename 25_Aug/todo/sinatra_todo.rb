require 'sinatra'
require 'sinatra/reloader'
require './lib/todo.rb'
require 'pry'

enable :sessions

set :port, 3000
valid = Validator.new("./public/authenticate.txt")
# my_list = TodoList.new("./public/tasks.txt")

		
my_list = nil
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
	session[:valid] = valid.check_valid(username.downcase,password)
	session[:user] = username
	redirect to ("/status")
end

get "/status" do
	if session[:valid]
		filename = session[:user] + "tasks.txt"
		my_list = TodoList.new(filename)
		redirect to ("/my_tasks")
	else
		@invalid = true
		erb :index
	end
end

get "/log_out" do
	session[:valid] = false
	redirect to ("/")
end

get "/my_tasks" do 
	@task_list = my_list.todo_list
	@username = session[:user]
	erb :my_tasks
end

post "/add_task" do
	new_task = params[:new_task]
	my_list.add_task(new_task)
	redirect to ("/my_tasks")
end

post "/mark_done" do
	index = params[:done].to_i
	my_list.mark_done(index)
	redirect to ("/my_tasks")
end

get "/done_list" do
	@task_list = my_list.todo_list
	erb :done
end

post "/delete" do
	index = params[:delete].to_i
	my_list.delete(index)
	redirect to ("/my_tasks")
end

post "/save_list" do
	filename = session[:user] + "tasks.txt"
	task_store = TaskStorage.new(filename)
	task_store.store_tasks(my_list.todo_list)
	redirect to ("/my_tasks")
end

post "/load_file" do
	tempfile = params[:file][:tempfile]
	my_list = TodoList.new(tempfile)
	redirect to ("/my_tasks")
end