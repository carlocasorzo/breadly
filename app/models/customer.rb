class Customer < ActiveRecord::Base
  has_many :orders
  has_many :products, through: :orders
  
  validates :name, presence: true
  
  
  def total_debt
    self.orders.unpaid.inject(0.0) { |sum, order| sum += order.total_cost  }
  end
  
  def total_income
    self.orders.paid.inject(0.0) { |sum, order| sum += order.total_cost  }
  end
end
