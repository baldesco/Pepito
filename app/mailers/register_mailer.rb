class RegisterMailer < ApplicationMailer
default from: "from@gmail.com"	#Esta no se si es necesaria aqui

	def register(client)
		@client=client
		mail 	:subject => 'Bienvenido a don Pepito',
				:to		 => @client.email,
				:from	 => 'contacto.stemsports@gmail.com'	
	end
end
