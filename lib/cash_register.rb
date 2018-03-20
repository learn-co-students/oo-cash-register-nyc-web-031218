# require "pry"

class CashRegister


attr_accessor :total, :discount, :title, :price, :quantity,:items


def initialize(discount = 0)
  @total = 0
  @discount = discount
  @items = []

end


def total
  @total
end





def add_item(title, price, quantity= 1)

    quantity.times do
      @items << title
    end

  @lastTransaction = price * quantity

  @total += price * quantity



end

def apply_discount
  if discount > 0
      @total = @total - (@total * discount)/ 100
      "After the discount, the total comes to $#{@total}."
    else
      "There is no discount to apply."
end

end

def items
  @items

end

def void_last_transaction
   @total -= @lastTransaction
end

end
