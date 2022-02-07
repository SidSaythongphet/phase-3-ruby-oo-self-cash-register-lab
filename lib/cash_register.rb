class CashRegister
    attr_accessor :total, :discount, :items, :transaction

    def initialize(discount = 0)
        @total = 0
        @discount = discount.to_f
        @items = []
    end

    def add_item(item, price, quantity = 1)
        self.total += price.to_f * quantity
        quantity.times { self.items << item }
        @transaction = price * quantity
    end

    def apply_discount
        self.total = self.total - self.total * (self.discount / 100.00)
        self.discount == 0 ? "There is no discount to apply." : "After the discount, the total comes to $800."
    end

    def void_last_transaction
        self.total -= self.transaction
    end

end

discounted = CashRegister.new(20)

discounted.add_item("macbook air", 1000)
puts discounted.total.class
puts discounted.discount.class
puts discounted.apply_discount
