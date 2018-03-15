class CashRegister

	attr_accessor :total, :discount, :items

	def initialize(discount = 0)
		@total = 0
		@discount = discount
		@items = []
	end

	def add_item(title,price,quantity = 1)
		@last_total = total
		@total += price * quantity
		quantity.times do
			@items << title
		end
	end

	def apply_discount
		if discount > 0
			@total = @total*(100-discount)/100
			"After the discount, the total comes to $#{total}."
		else
			"There is no discount to apply."
		end
	end

	def void_last_transaction
		@total = @last_total
	end


	end
