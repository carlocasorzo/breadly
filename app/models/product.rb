class Product < ActiveRecord::Base
  has_many :orders
  has_many :customers, through: :orders
  
  validates :name, presence: true
  validates :description, length: { maximum: 1000 }, presence: true
  validates :price, presence: true, numericality: {greater_than: 0}
  validates :image, presence: true
  
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
