class Cart < ActiveRecord::Base
  has_many :line_items
  has_many :items, through: :line_items

  belongs_to :user

  def total
    sum = 0
    #self.items.each { |item| sum += item.price } #ALSO WORKS: self.items.collect { |item| item.price }.inject(0, :+)
    self.line_items.each do |line_item|
      sum += line_item.item.price * line_item.quantity
    end
    sum
  end

  def add_item(add_item_id)
    if line_item = self.line_items.find_by(item_id: add_item_id)
      line_item.quantity += 1
    else
      line_item = LineItem.new(cart_id: self.id, item_id: add_item_id) #defaults to quantity of 1
    end
    line_item
  end
  
  def checkout
    self.status = "submitted"
    self.line_items.each do |line_item| 
      line_item.item.inventory -= line_item.quantity
      line_item.item.save
    end
  end
end
