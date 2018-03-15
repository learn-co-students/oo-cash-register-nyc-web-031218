require "pry"

class CashRegister

  attr_reader :total, :discount
  attr_writer :total
  attr_accessor :item, :quantity, :price

  def initialize(discount = nil)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(item, price, quantity = 1)
    @price = price
    @quantity = quantity
    @total += (price * quantity.to_f)
    quantity.times do
      @items << item
    end
  end

  def apply_discount
    if @discount == nil
      "There is no discount to apply."
    else
      @total = @total - (@total * (@discount * 0.01))
      "After the discount, the total comes to $#{@total.to_i}."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    #binding.pry
    @total = @total - @price
  end

end
