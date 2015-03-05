require "rails_helper"

RSpec.describe Sell, :type => :model do 
	
	#context 'when the sell is changed' do
		before do
			@client = Client.create(name: 'demo', email: 'demo@demo.com',password: '1234')
			@sell = Sell.create(total: 0,client_id: @client.id)
			@product = Product.create(ref: 'AA11',price: 1000, quantity: 10, size: 'M')
			
		end
		it 'new lineitem' do
			tot = @sell.total
			cant = @product.quantity
			@item = Lineitem.create(product_id: @product.id, sell_id: @sell.id, value: 1500, quantity:2)
			@sell.add_item(@item)
			expect(@sell.total).not_to eq tot
			expect(@product.quantity).not_to eq cant #esta no valida, falta el metodo en algun lado
			
		end
	end