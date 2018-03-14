require 'pry'

class CashRegister

  attr_accessor :total, :cart, :last_transaction_amount
  attr_reader :discount


  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @cart = []
  end

  def add_item(title, price, quantity = 1)

    i = 1
    while i <= quantity
      @cart.push(title)
      i+=1
    end

    @last_transaction_amount = price
    @total += price * quantity
  end

  def apply_discount

    if discount >0
      @total *= 1 - @discount/100.to_f
      "After the discount, the total comes to $#{@total.to_i}."
    else
      "There is no discount to apply."
    end

  end

  def items
    @cart

  end

  def void_last_transaction
    @total-= @last_transaction_amount#last item

  end



end

cash_discount = CashRegister.new(20)

 # binding.pry

puts "x"
