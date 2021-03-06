class Order < ActiveRecord::Base
  belongs_to :customer
  belongs_to :product
  
  validates :product_id, presence: true
  validates :customer_id, presence: true
  validates :quantity, inclusion: { in: (1..20) }
  
  before_create :calculate_total_cost
  
  scope :latest, -> { order 'created_at DESC' }
  scope :paid, -> { where paid: true }
  scope :unpaid, -> { where paid: false }
  
  def pay
    self.paid = true
    self.save
  end
  
  
  private
    def calculate_total_cost
      self.total_cost = self.quantity * self.product.price
    end
end
