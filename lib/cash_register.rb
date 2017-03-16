require 'pry'

class CashRegister

	attr_accessor :total, :items, :last_transaction
	attr_reader :discount

	def initialize(discount=nil)
		@total = 0
		@discount = discount
		@items = []
	end

	def add_item(title, price, quantity=1)
		self.total += price * quantity

		quantity.times do
			self.items << title
		end

		self.last_transaction = price * quantity
	end

	def apply_discount
		if self.discount == nil
			"There is no discount to apply."
		else
			self.total -= self.total * (self.discount / 100.0)
			self.total = self.total.to_i
			"After the discount, the total comes to $#{self.total}."
		end
	end

	def void_last_transaction
		self.total -= self.last_transaction
	end

end