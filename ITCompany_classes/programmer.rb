class Programmer

	attr_reader :skill, :rationality, :fatigue, :order, :manager

	def initialize(options)
		@skill = options[:skill]
		@rationality = options[:rationality]
		@fatigue = options[:fatigue]
		@order = options[:order]
		@manager = options[:manager]
	end


end