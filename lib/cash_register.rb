require 'pry'

class CashRegister
  attr_accessor :total, :last_item_price
  attr_reader :discount, :items

  def initialize(discount = nil)
    @total = 0
    @discount ||= discount
    @items = []
  end

  def add_item(title, price, quantity = nil)
    @last_item_price = price

    if quantity
      self.total += (price * quantity)
      quantity.times do
        self.items << title
      end
    else
      self.total += price
      self.items << title
    end
  end

  def apply_discount
    if self.discount
      self.total -= (self.total * (self.discount.to_f / 100))
      "After the discount, the total comes to $#{self.total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    self.total -= @last_item_price
  end
end

# cash_register = CashRegister.new(20)
# puts cash_register.total
# puts cash_register.discount
# binding.pry
# puts cash_register.items
