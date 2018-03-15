require "pry"

class CashRegister

  attr_accessor :total, :last_transaction
  attr_reader :discount

  def initialize(discount=nil)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title, price, quantity=1)
    item_cost = price * quantity
    self.total += item_cost

    quantity.times do
      @items << title
    end

    self.last_transaction = quantity * price

  end

  def apply_discount
    unless discount == nil
      discount_total = (self.discount.to_f / 100) * (self.total.to_f)
      @total -= discount_total.to_i
      "After the discount, the total comes to $#{@total}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    self.total -= self.last_transaction
  end


end
