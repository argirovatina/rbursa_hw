class Order

	attr_reader :complexity, :clear, :deadline, :customer, :manager

	def initialize(options)
		@complexity = options[:complexity]
		@clear = options[:clear]
		@deadline = options[:deadline]
		@customer = options[:customer]
		@manager = options[:manager]
	end
end