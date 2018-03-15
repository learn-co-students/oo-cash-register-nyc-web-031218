require 'pry'

class CashRegister

attr_accessor :total, :discount, :quantity, :item, :last_transaction



  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
    @last_transaction = 0
  end

  def add_item(title, price, quantity = 1)
    @last_transaction = price * quantity
    @total += @last_transaction
    quantity.times {@items << title}
  end

  def apply_discount
    if @discount == 0
      "There is no discount to apply."
    else
      @total = total - total * @discount / 100
      "After the discount, the total comes to $#{@total}."
    end
  end

  def items
    @items
  end

  def void_last_transaction
   @total -= @last_transaction
  end










end
