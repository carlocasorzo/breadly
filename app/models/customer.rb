class Customer < ActiveRecord::Base
  has_many :orders
  has_many :products, through: :orders
  
  #scope :debtors, -> { where paid: false }
  
  
  def total_debt
    self.orders.unpaid.inject(0.0) { |sum, order| sum += order.total_cost  }
  end
  
  def total_income
    self.orders.paid.inject(0.0) { |sum, order| sum += order.total_cost  }
  end
end
