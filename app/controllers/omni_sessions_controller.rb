class OmniSessionsController < ApplicationController
	def create
		auth = request.env['omniauth.auth']
		client=Client.where(provider: auth['provider'],uid: auth['uid']).first||CLient.create_with_omniauth(auth)
		session[:client_id] = client.id
		redirect_to root_path
	end
end
