class OrderAddress
  include ActiveModel::Model
  attr_accessor 
  with_options presence: true do
    validates

  def save
    Order.create()
    Address.create()
  end
end