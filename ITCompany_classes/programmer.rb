class Programmer

	attr_reader :skill
	attr_reader :rationality
	attr_reader :fatigue
	attr_reader :order
	attr_reader :manager

	def initialize(options)
		@skill = options[:skill]
		@rationality = options[:rationality]
		@fatigue = options[:fatigue]
		@order = options[:order]
		@manager = options[:manager]
	end


end