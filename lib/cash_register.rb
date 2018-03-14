require 'pry'

class CashRegister

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
    @last_transaction = nil
  end

  attr_reader(:discount)
  attr_accessor(:total)

  def add_item(title, price, quantity=1)
    @total += price * quantity
    quantity.times do
      @items << title
    end
    @last_transaction = price * quantity
  end

  def apply_discount
    if @discount != 0
      @total -= (@total.to_f * (@discount.to_f * 1 / 100)).to_i
      "After the discount, the total comes to $#{self.total}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    @total -= @last_transaction
  end

end

# Pry.start
