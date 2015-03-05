require 'csv'

namespace :gen do

  desc "Genera una lista de usuarios"
  task clients: :environment do
  	#Elegir el directorio donde se va a guardar el archivo y el nombre del archivo
  	CSV.open('c:/Users/Andre/Aplicaciones/Rails/clientes.csv','w') do |csv| #La 'w' es para q escriba y sobre escriba
  		Client.all.each do |client|
  			csv << [client.email, client.name]
  		end
  	end

  end

end
