
require 'pry'
class CashRegister

  attr_accessor  :total, :items
  attr_reader :discount

  def initialize (discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title, price, quantity = 1)
    @total+=(price*quantity)
    @final_item = price*quantity
    (1..quantity).each do |food|
      @items << title
    end
  end

  def apply_discount
    # binding.pry
    @before_discount = @total
    @total*=(1-(@discount/100.0))
    # binding.pry
    if @before_discount>@total
      return "After the discount, the total comes to $#{@total.to_i}."
    else
      return "There is no discount to apply."
    end
  end

  def items
    @items

  end

  def void_last_transaction
    @total-=@final_item
  end


end



#
