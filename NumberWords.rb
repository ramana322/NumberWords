class PhoneNumberSome

	attr_reader :phone_number

	MAPPINGS = {
    2 => ["a", "b", "c"],
    3 => ["d", "e", "f"],
    4 => ["g", "h", "i"],
    5 => ["j", "k", "l"],
    6 => ["m", "n", "o"],
    7 => ["p", "q", "r", "s"],
    8 => ["t", "u", "v"],
    9 => ["w", "x", "y", "z"],
  }

	def initialize(phone_number)
		@phone_number = phone_number
	end

	def get_possible_words
		leters = phone_number.to_s.chars
		leters.delete("0")
		leters.delete("1")

		complete_string = leters.uniq.reduce("") do |acc, char|
			acc = acc + MAPPINGS[char.to_i].join
			acc
		end.chars.uniq.join

		# f = File.open("/home/venkat/Desktop/dictionary.txt", "r")
		# 		f.each_line do |line|
 	# 	 			words << line
		# 		end
  # 		print @max_length_word = words.max_by(&:length).length
		# f.close
		# 16
		words = []

		(3..16).each do |di|
			words << complete_string.chars.repeated_combination(di).to_a.map(&:join)
		end

		words.flatten

		words.map(&:upcase) & words_from_dictionary 
	end

	def words_from_dictionary
		words = []

		File.open("/home/venkat/Desktop/dictionary.txt", "r") do |file|
			words = file.read.split(//).map(&:strip)
		end
		words
	end
end