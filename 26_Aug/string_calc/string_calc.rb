
class StringCalc
	def initialize
		@numbers_array = []
	end
	
	def add(numbers)
		convert_to_array(numbers)
		@numbers_array.reduce(0,:+)
	end

	def multiply(numbers)
		if numbers.empty?
			0
		else
			convert_to_array(numbers)
			@numbers_array.reduce {|memo,obj| obj==0 ? memo : (memo * obj)}
		end
	end

	def power(numbers)
		convert_to_array(numbers)
		while (@numbers_array.length > 1) do
				nums = @numbers_array.slice!(0,2)
				@numbers_array.unshift(power_helper(nums[0],nums[1]))
		end
		@numbers_array[0] 
	end

	def power_helper(base, exp)
		result =1
		exp.times do
			result =* base
		end
		result
	end

	def convert_to_array(numbers)
		if numbers.include?(",")
			@numbers_array = numbers.split(",").map {|x| x.to_i}
		else
			@numbers_array = numbers.split("\n").map {|x| x.to_i}
		end
	end

end

