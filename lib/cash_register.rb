class CashRegister

  attr_reader
  attr_accessor :discount, :total, :items, :last_transaction

  def initialize(discount=0)
    @discount = discount
    @total = 0
    @items = []
  end

  def add_item(title, price, quantity=1)
    @total += (price * quantity)
    quantity.times do
      @items << title
    end
    @last_transaction = price * quantity
  end

  def apply_discount
    if discount > 0
      self.total = total - total * @discount / 100.00
      return "After the discount, the total comes to $#{self.total.to_i}."
      @total = self.total
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    self.total = @total - @last_transaction
  end 

end
