class CashRegister
attr_accessor :total
attr_reader :discount

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
    @cart_history = []
  end

  def add_item(title, price, quantity = 1)
    @total += price * quantity
    quantity.times do
    @items.push(title)
  end
    @cart_history << price * quantity
  end

  def apply_discount
    if @discount == 0
      "There is no discount to apply."
    else
    @total -= @total * @discount/100
    "After the discount, the total comes to $#{@total}."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    @total -= @cart_history[-1]
    @cart_history.pop
  end

end
