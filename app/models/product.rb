class Product < ActiveRecord::Base

	validates :ref, :price, :quantity, :size, presence: true #Tiene que haber un valor en ref
	validates :ref, uniqueness: {message: "Esa referencia ya existe"}
	#Esta no sirvió: validates :size, acceptance: { accept: "S","M","L","XL" }
	validates :ref, format: { with: /\A[1-9A-Z]+\z/, message: "solo admite números y letras mayúsculas" }
	validates :size, length: {in: 1..3}
	validates :size, inclusion: { in: %w(S M L XL), message: "%{value} is not a valid size" }
	validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 0, message: "El precio no puede ser negativo" }

	has_many :lineitems
	has_many :promos
end