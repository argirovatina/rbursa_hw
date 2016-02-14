class Manager

	attr_reader :communicability, :ability_to_organize

	def initialize(options)
		@communicability = options[:communicability]
		@ability_to_organize = options[:ability_to_organize]
	end

end