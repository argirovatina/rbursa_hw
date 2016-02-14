class Customer

	attr_reader :requirements, :remuneration, :competence, :adequacy, :manager

	def initialize(options)
		@requirements = options[:requirements]
		@remuneration = options[:remuneration]
		@competence = options[:competence]
		@adequacy = options[:adequacy]
		@manager = options[:manager]
	end
end