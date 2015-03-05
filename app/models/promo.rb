class Promo < ActiveRecord::Base
	validates :title,:discount, presence: true
	validates :discount, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than: 100, message: "Valor inválido"}   

	belongs_to :product
end
