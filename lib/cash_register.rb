class CashRegister

  attr_accessor :total, :discount, :items, :last_item

  def initialize(discount = 0)
    @total = 0.0
    @discount = discount
    @items = []
  end

  def add_item(title, price, quantity = 1)
    self.total += price * quantity
    self.last_item = [price, quantity]
    quantity.times do
      self.items << title
    end
  end

  def apply_discount
    if self.discount != 0.0
      self.total -= self.total * self.discount / 100.0
      "After the discount, the total comes to $#{self.total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    self.items.pop
    self.total -= self.last_item[0] * self.last_item[1]
  end

end
