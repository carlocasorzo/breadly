class OrderCalculator
  
  def self.unpaid_total
    Order.unpaid.inject(0) { |sum, o| sum += o.total_cost }
  end
  
  def self.paid_total
    Order.paid.inject(0) { |sum, o| sum += o.total_cost }
  end
  
end