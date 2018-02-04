class Sale < ActiveRecord::Base
  #Validates
  validates :buyer, :description, :price, :quantity, presence: true
  validates :quantity, numericality: { only_integer: true }
end
