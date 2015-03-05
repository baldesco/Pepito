class Sell < ActiveRecord::Base
	validates :total, numericality: {only_integer: true, greater_than: 0, message: "El total de la venta no puede ser negativo" }

	has_many :lineitems, after_add: :add_item, after_remove: :remove_item
	belongs_to :client

	def add_item(line_item)
		if line_item.valid?
			self.update_attribute(:total, self.total+line_item.value)	
		end
	end

	def remove_item
		if line_item.valid?
			self.update_attribute(:total, self.total-line_item.value)	
		end
	end
	
end
