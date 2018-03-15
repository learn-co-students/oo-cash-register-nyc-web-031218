require 'pry'
class CashRegister
  attr_accessor :total, :discount, :quantity

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items_array = []
  end

  def add_item(title, price, quantity = 1)
    self.quantity = quantity
    quantity.times do
      self.total += price
      @items_array << title
    end
  end

  def apply_discount
    if discount > 0
      self.total -= (self.total * (self.discount.to_f / 100.00)).to_i
      "After the discount, the total comes to $#{self.total}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @items_array
  end

  def void_last_transaction
    self.total -= self.total
  end

end
