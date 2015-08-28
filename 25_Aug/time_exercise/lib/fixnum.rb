class Fixnum

	def hours
		self * 60 * 60
	end

	def before
		Time.now - self
	end

	def after
		Time.now +  self
	end
end
