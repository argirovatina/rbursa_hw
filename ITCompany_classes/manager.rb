class Manager

	attr_reader :communicability
	attr_reader :ability_to_organize

	def initialize(options)
		@communicability = options[:communicability]
		@ability_to_organize = options[:ability_to_organize]
	end

end