class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def login_required
    if session[:client_id].nil?
      redirect_to login_clients_path, notice: 'Debes logearte primero'
    end
  end

  def current_client
  	#if session[:client_id]
  		@current_client ||= CLient.find(session[:client_id])
  	#end
  end

end
