class ShopInventory
    def initialize(arr)
        @arr = arr
    end
  
    def item_in_stock
        a = []
        @arr.each { |x| a << x[:name] if x[:quantity_by_size].length > 0 }
        a.sort
    end
  
    def afforbadle
        a = []
        @arr.each { |x| a << x if x[:price] < 50 }
        a
    end
  
    def out_of_stock
        a = []
        @arr.each { |x| a << x if x[:quantity_by_size].length == 0 }
        a
    end
  
    def how_much_left(name)
        @arr.each { |x| return x[:quantity_by_size] if x[:name] == name }
    end
  
    def total_stock
        a = 0
        @arr.each { |x| x[:quantity_by_size].each { |k, v| a += v } }
        a
    end
  end

  inventory = [ 
    {price: 125.00, name: "Cola", quantity_by_size: {l033: 3, l05: 7, l1: 8, l2: 4}}, 
    {price: 40.00, name: "Pepsi", quantity_by_size: {}}, 
    {price: 39.99, name: "Water", quantity_by_size: {l033: 1, l2: 4}}, 
    {price: 70.00, name: "Juice", quantity_by_size: {l033: 7, l05: 2}} 
    ]
    
    puts "Item in stock: "
    print ShopInventory.new(inventory).item_in_stock

    puts "\nAffordable: "
    print ShopInventory.new(inventory).afforbadle 
    
    puts "\nOut of stock: "
    print ShopInventory.new(inventory).out_of_stock 
    
    puts "\nHow much left:"
    print ShopInventory.new(inventory).how_much_left("Cola") 
    
    puts "\nTotal stock:"
    puts ShopInventory.new(inventory).total_stock