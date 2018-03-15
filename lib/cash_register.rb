
require 'pry'
class CashRegister

  attr_accessor :total, :discount, :price, :items

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title, price, quantity=1)
    @price = price
    @total += (price*quantity)
    quantity.times {@items << title}
  end

  def apply_discount
    if @discount != 0
      @total = (@price - (@price * (@discount/100.to_f))).to_i
      "After the discount, the total comes to $#{total}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    @total -= self.price
  end


end
