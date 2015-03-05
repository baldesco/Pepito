class Lineitem < ActiveRecord::Base
	#validates :product_id, :sell_id, :quantity, numericality: {only_integer: true, greater_than_or_equal_to: 0, message: "%{value} no es un valor válido." }
	validates :sell_id, uniqueness: {message: "Referencia de producto o venta ya existente"}
	validate :validate_stock

	belongs_to :product
	belongs_to :sell

	before_create :init_value
	after_create :update_stock
	after_destroy :add_stock

	def init_value
		self.value = self.quantity*self.product.price
	end

	def update_stock
		self.product.update_attribute(:quantity, self.product.quantity-self.quantity)
	end

	def validate_stock
		if self.quantity>self.product.quantity
			errors.add(:quantity, "Se acabó el producto")
		end
	end

	def add_stock
		self.product.update_attribute(:quantity, self.product.quantity+self.quantity)
	end
end
