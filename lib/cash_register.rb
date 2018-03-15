require "pry"

class CashRegister
  attr_reader :discount, :items
  attr_accessor :total

  def initialize(discount=0)
    @items = []
    @total = 0
    @discount = discount
  end

  def add_item(title, price, quantity=1)
    @items.fill(title, @items.size, quantity)
    @total += price * quantity
  end

  def apply_discount
    @total = @total - (@total * @discount / 100)
    if @discount > 0
      "After the discount, the total comes to $#{@total}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    @total = 0
  end

end
