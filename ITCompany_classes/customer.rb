require 'pry'
class Customer

	attr_reader :requirements
	attr_reader :remuneration
	attr_reader :competence
	attr_reader :adequacy
	attr_reader :manager

	def initialize(options)
		@requirements = options[:requirements]
		@remuneration = options[:remuneration]
		@competence = options[:competence]
		@adequacy = options[:adequacy]
		@manager = options[:manager]
	end
end

binding.pry