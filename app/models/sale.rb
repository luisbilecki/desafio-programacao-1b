class Sale < ActiveRecord::Base
  #Validates
  validates :buyer, :description, :price, :quantity, presence: true
  validates :quantity, numericality: { only_integer: true }

  def format_money
    helper.number_to_currency(self.price.to_s)
  end

  private

  def helper
    @helper ||= Class.new do
      include ActionView::Helpers::NumberHelper
    end.new
  end
end
