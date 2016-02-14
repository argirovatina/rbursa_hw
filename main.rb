require_relative 'ITCompany_classes/customer'
require_relative 'ITCompany_classes/order'
require_relative 'ITCompany_classes/programmer'
require_relative 'ITCompany_classes/manager'

class ItCompanySimulator
	def self.start
		manager = Manager.new({communicability: 100, ability_to_organize: 100})
		customer = Customer.new({requirements: 100, remuneration: 100, competence: 100, adequacy: 100, manager: manager})
		order = Order.new({complexity: 100, clear: 100, deadline: 100, customer: customer, manager: manager})
		programmer = Programmer.new({skill: 100, rationality: 100, fatigue: 100, order: order, manager: manager})
	end
end

ItCompanySimulator.start