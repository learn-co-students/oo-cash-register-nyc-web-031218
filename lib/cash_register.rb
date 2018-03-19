class CashRegister

  attr_accessor :total, :discount, :last_transaction

  def initialize(num = 0)
    @total = 0
    @discount = num.to_f
    @items = []
  end

  def add_item(title, price, quantity = 1)
    price = price * quantity
    @title = title
    quantity.times do
      @items << title
    end
    @last_transaction = price
    @total += price
  end

  def apply_discount
    @total = (@total * (1 - @discount/100)).to_i
    @discount > 0 ? "After the discount, the total comes to $#{@total.to_i}." : "There is no discount to apply."
  end

  def items
    @items
  end

  def void_last_transaction
    @total -= @last_transaction
  end

end
