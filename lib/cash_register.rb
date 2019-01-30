require 'pry'
class CashRegister
    attr_accessor :total, :discount, :last_item

    def initialize(employee_discount = 0)
      @total = 0
      @discount = employee_discount
      @cart = []
      @last_item = {}
    end

    def add_item(item, price, quantity = 1)
      @total += (price * quantity)
      quantity.times {@cart << item}
      @last_item.clear
      @last_item[:price] = price
      @last_item[:quantity] = quantity
    end

    def apply_discount
      if @discount > 0
        @total *= 1.to_f - (@discount.to_f / 100)
        "After the discount, the total comes to $#{@total.to_i}."
      else
        "There is no discount to apply."
      end
    end

    def items
      @cart
    end

    def void_last_transaction
      @last_item[:quantity].times {@cart.pop}
      @last_item[:quantity].times {@total -= @last_item[:price]}
    end
end
