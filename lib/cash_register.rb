class CashRegister
  attr_accessor :total, :discount, :previous, :items

  def initialize (employee_discount = false)
    @total = 0
    @discount = employee_discount
    @items = []
  end

  def total
    @total
  end

  def add_item (title, price, quantity = 1)
    @previous = self.total
    @total += price * quantity
    while quantity > 0
      @items << title
      quantity -= 1
    end
  end

  def apply_discount
    if @discount
      @total = self.total - self.total * @discount / 100
      "After the discount, the total comes to $#{@total}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    @total = self.previous
    @items.shift
  end

end
