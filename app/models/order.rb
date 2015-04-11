class Order < ActiveRecord::Base

	belongs_to :cart
 	belongs_to :user
 	has_many   :line_items, dependent: :destroy
  	has_many   :transactions, :class_name => "OrderTransaction"
  
  	validates :first_name, :last_name, :adress, presence: true


 	def add_line_items_from_cart(cart)
		cart.line_items.each do |item|
			item.cart_id = nil
			line_items << item
		end
	end

	def count_back_order
	  orders.each do |order|
	  	if order.status = "Возврат"
	  		@order_back = @order_back + 1
	  	end
	  end 	
	end	

end
