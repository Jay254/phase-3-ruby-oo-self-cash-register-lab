class CashRegister
    attr_accessor :total, :discount
  
    def initialize(discount = 0)
      @discount = discount
      @total = 0
      @items = []
      @last_transaction = 0
    end
  
    def add_item(title, price, quantity = 1)
      @total += price * quantity
      quantity.times { @items << title }
      @last_transaction = price * quantity
    end
  
    def apply_discount
      if discount.zero?
        "There is no discount to apply."
      else
        @total = @total * (100 - @discount) / 100
        "After the discount, the total comes to $#{@total}."
      end
    end
  
    def items
      @items
    end
  
    def void_last_transaction
      @total -= @last_transaction
      @items.pop
      reset_total if @items.empty?
    end

    def reset_total
      @total = 0.0
    end
  end
  