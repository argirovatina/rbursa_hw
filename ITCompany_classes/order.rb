class Order

	attr_reader :complexity
	attr_reader :clear
	attr_reader :deadline
	attr_reader :customer
	attr_reader :manager

	def initialize(options)
		@complexity = options[:complexity]
		@clear = options[:clear]
		@deadline = options[:deadline]
		@customer = options[:customer]
		@manager = options[:manager]
	end
end