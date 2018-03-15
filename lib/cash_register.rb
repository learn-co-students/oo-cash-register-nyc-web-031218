require 'pry'
class CashRegister
  attr_accessor :total
  attr_reader :discount, :items

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title, price, qty = 1)
    @prev_transaction = price * qty
    @total += (price * qty)
    while qty > 0
      @items << title
      qty -= 1
    end
  end

  def apply_discount
    if @discount > 0
      @total *= (1-(@discount/100.0))
      return "After the discount, the total comes to $#{@total.to_i}."
    else
      return "There is no discount to apply."
    end
  end

  def void_last_transaction
    @total -= @prev_transaction
  end

end
