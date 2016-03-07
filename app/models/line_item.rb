class LineItem < ActiveRecord::Base
  #join table
  belongs_to :cart
  belongs_to :item

  after_initialize :init

  def init
    self.quantity ||= 1 #will set the default value only if it's nil
  end
end
