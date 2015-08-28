class TodoList
	attr_reader :todo_list

	def initialize(filename)
		@todo_list = TaskStorage.new(filename).load_tasks
	end

	def add_task(task)
		@todo_list.push(Task.new(task, @todo_list.length))
	end	

	def get_task_content
		valid_list = @todo_list.map {|task| task.status ? task.content : ""} 
		valid_list.delete("")
		valid_list
	end

	def mark_done(index)
		@todo_list[index].mark_done
	end


	def delete(index)
		@todo_list.delete_at(index)
		renumber
	end

	def renumber
		@todo_list.map!.with_index { |task, i| Task.new(task.content, i, task.status)}
	end
end

class Task
	attr_reader :content, :status, :id

	def initialize(content, id, status = true)
		@content = content
		@id = id
		@status = status
	end

	def mark_done
		@status = false
	end
end

class TaskStorage
	attr_reader :task_list
	def initialize(filename)
		@filename = filename
	end

	def load_tasks
		file = File.read(@filename)
		@task_list =[]
		file.each_line do |task|
			task_array = task.split(",")
			@task_list << Task.new(task_array[0], task_array[1].to_i, (task_array[2].strip == "true" ? true : false))
		end
		
		@task_list	
		
	end

	def store_tasks(task_list)
		file = ""
		task_list.each do |task|
			file << "#{task.content},#{task.id},#{task.status}\n"
		end

		File.write(@filename,file)
	end
end

class Validator
	attr_reader :user_pwd
	
	def initialize(filename)
		@filename = filename
		@user_pwd ={}
		create_hash
	end

	def create_hash
		file = File.read(@filename)
		file.each_line do |pair|
			pair_array = pair.split("-")
			@user_pwd[pair_array[0]] = pair_array[1].strip
		end
	end

	def check_valid(user, password)
		@user_pwd[user] == password
	end
end

# valid = Validator.new("../public/authenticate.txt")
# valid.create_hash

# puts valid.check_valid("kam","1234")

# store = TaskStorage.new("new_file.txt")
# store.store_tasks([Task.new("sfkhkajsdhfh",0), Task.new("task 2",1)])
# store.load_tasks

# print store.task_list