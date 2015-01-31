class Order < ActiveRecord::Base
  belongs_to :customer
  belongs_to :product
  
  before_create :calculate_total_cost
  
  
  private
    def calculate_total_cost
      self.total_cost = self.quantity * self.product.price
    end
end
