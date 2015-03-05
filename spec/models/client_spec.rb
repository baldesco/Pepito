require "rails_helper"

RSpec.describe Client, :type => :model do 
	before do
		stub_client
	end

	it 'save an user with a name and email' do
	client = Client.create(name: 'demo', email: 'demo@demo.com',password: '1234')
	expect(client.persisted?).to be true
	end	
	
	it 'save an user with a name and email' do
	client = Client.create(name: '', email: 'demo@demo.com',password: '1234')
	expect(client.persisted?).to be false
	expect(client).to have(1).error_on(:name)
	end	

	it 'save an user with a name and email' do
	client = Client.create(name: 'demo', email: '',password: '1234')
	expect(client.persisted?).to be false
	expect(client).to have(1).error_on(:email)
	end	

	it 'save an user with a name and email' do
	client = Client.create(name: 'demo', email: 'demo@demo.com',password: '')
	expect(client.persisted?).to be false
	expect(client).to have(1).error_on(:password)
	end	

	context 'when client saved' do
		before do
			@client = create_client
		end
		it 'changed email to client' do
			bool=@client.update_attribute(:email,'demo@demo.com')
			expect(bool).to be true
			expect(@client.email).to eq 'demo@demo.com'
		end
		it 'changed name to client' do
			bool=@client.update_attribute(:name,'Don Pepe')
			expect(bool).to be true
			expect(@client.name).to eq 'Don Pepe'
		end
		it 'deletes the client' do
			@client.destroy
			expect(Client.count).to eq 0
		end
		it 'find a client' do
			found=Client.where(name: @client.name).exists?
			expect(found).to be true
			#@client=Client.where(name: 'demo').first #otra opción
			#expect(@client).not_to be nil
		end
	end
end