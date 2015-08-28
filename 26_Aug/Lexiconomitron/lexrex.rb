class Lexiconomitron
	def initialize

	end

	def eat_t(phrase)
		phrase.delete("tT")
	end

	def shazam(phrase)
		new_phrase = phrase.split.map {|each| eat_t(each.reverse)}
		[new_phrase.first, new_phrase.last]
	end

	def oompa_loompa(phrase)
		phrase_array = phrase.split
		phrase_array.delete_if {|a| a.length>3}
		phrase_array.map {|each| eat_t(each)}
	end

end