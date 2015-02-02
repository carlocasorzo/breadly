class Product < ActiveRecord::Base
  has_many :orders
  has_many :customers, through: :orders
  
  def total_sales
    self.orders.inject(0) { |sum, order| sum += order.quantity  }
  end
  
  def total_income
    self.orders.paid.inject(0) { |sum, order| sum += order.total_cost  }
  end
  
  def total_debt
    self.orders.unpaid.inject(0) { |sum, order| sum += order.total_cost  }
  end
end
