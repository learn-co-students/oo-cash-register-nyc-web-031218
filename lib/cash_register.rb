require 'pry'

class CashRegister
  attr_accessor :discount, :total, :items

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
    @transactions = []
  end

  def add_item(item, price, quantity=1)
    @transactions << price * quantity
    quantity.times do
      @items << item
    end
    @total += price * quantity
    return @total
  end

  def apply_discount
    if discount > 0
      @total = @total * (1-(@discount/100.0))
      return "After the discount, the total comes to $#{@total.to_i}."
    else
      return "There is no discount to apply."
    end
  end

  def void_last_transaction
    @items.pop
    @total -= @transactions[-1]
    @transactions.pop
  end
end
