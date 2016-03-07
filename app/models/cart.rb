class Cart < ActiveRecord::Base
  has_many :line_items
  has_many :items, through: :line_items

  belongs_to :user

  def total
    sum = 0
    self.items.each { |item| sum += item.price } #ALSO WORKS: self.items.collect { |item| item.price }.inject(0, :+)
    sum
  end

  def add_item(item_id)
    
  end
end
