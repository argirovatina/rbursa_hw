require 'pry'
require_relative '/Users/tina/rbursa_hw/ITCompany_classes/customer.rb'
require_relative '/Users/tina/rbursa_hw/ITCompany_classes/order.rb'
require_relative '/Users/tina/rbursa_hw/ITCompany_classes/programmer.rb'
require_relative '/Users/tina/rbursa_hw/ITCompany_classes/manager.rb'

class ItCompanySimulator
	def self.start
		customer = Customer.new({requirements: 100, remuneration: 100, competence: 100, adequacy: 100, manager: manager})
		order = Order.new({complexity: 100, clear: 100, deadline: 100, customer: customer, manager: manager})
		manager = Manager.new({communicability: 100, ability_to_organize: 100})
		programmer = Programmer.new({skill: 100, rationality: 100, fatigue: 100, order: order, manager: manager})
	end
end
binding.pry