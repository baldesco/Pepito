module GeneralHelpers

	def stub_client
		allow_any_instance_of(client).to receive(:send_email).and_return(nil)
	end

	def create_client
		@client=Client.create(name: 'demo',email:"demo@demo.com",password='1234')
	end


end	