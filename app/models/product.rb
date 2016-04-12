class Product < ActiveRecord::Base
  validates :description, :name, presence: true
  validates :price_in_cents, numericality: {only_integer: true}

  #this prevents it from working but there's no error message
  #the error message is placed in the forms view

  def formatted_price
    price_in_dollars = price_in_cents.to_f / 100
    sprintf("%.2f", price_in_dollars)
  end
  
end
