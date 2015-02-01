class Customer < ActiveRecord::Base
  has_many :orders
  has_many :products, through: :orders
  
  #scope :debtors, -> { where paid: false }
end
