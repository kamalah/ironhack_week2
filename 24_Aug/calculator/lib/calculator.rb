class Calculator
	attr_accessor :recall
	def initialize
		@recall = nil
	end

	def add(num1, num2)
		num1+num2
	end

	def subtract(num1, num2)
		num1-num2
	end

	def multiply(num1, num2)
		num1*num2
	end

	def divide(num1, num2)
		num1/num2
	end

	def save(num)
		File.write("save_num.txt",num)
	end

	def read_num
		@recall = File.read("save_num.txt").to_i
	end

	def clear
		@recall = nil
	end
end

# my_calc = Calculator.new
# my_calc.save(3)

# puts my_calc.read_num
