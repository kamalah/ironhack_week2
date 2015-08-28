class RandomPhrase
	attr_reader :phrase_array
	def initialize
		@phrase_array = ["Hello my name is Kamalah", "I am from California", "I am a pisces.", "Ironhack is so much fun.", "It is almost fall in Barcelona."]
	end

	def get_random_phrase
		@phrase_array.sample
	end

	def add_phrase(phrase)
		@phrase_array.push(phrase)
	end

	def number
		@phrase_array.length
	end

	def get_phrase(ind)
		@phrase_array[ind]
	end

	def remove_phrase(ind)
		@phrase_array.delete_at(ind)
	end

end