class ClientsController < ApplicationController

  before_action :load_client, only:[:show, :edit, :update, :destroy]  
	#clients/index

  respond_to :html, :json, :xml
  def index
  	@clients=Client.all
  	#puts "#{@clients.inspect}"
  end

  #clients/123
  def show
  end

  #clients/new
  def new
	@client=Client.new  	
  end

  #clients/create
  def create
  	params_filtered=params.require(:client).permit(:name,:email,:password,:avatar)
  	@client=Client.new(params_filtered)
  	if @client.save
  		redirect_to clients_path
  	else
  		render 'new'
  	end

  end

  def edit
    #@client = Client.find(params[:id])
  end

  #clients/update
  def update
    params_filtered=params.require(:client).permit(:name,:email)
    if @client.update(params_filtered)
      redirect_to clients_path
    else
      render 'edit'
    end
  end

  def destroy
    @client.destroy
    redirect_to clients_path, notice: 'Usuario eliminado'
  end

  def load_client
    begin
      @client = Client.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      redirect_to clients_path,
      notice: 'El usuario no está resgitrado en la base de datos'
    end
  end

  def login
    @client = Client.new
  end

  def do_login
    params_filtered = params.require(:client).permit(:email, :password)
    @client = Client.new(params_filtered)
    client_fetch = @client.login #devuelve la info del usuario id
    if client_fetch
      session[:client_id] = client_fetch.id
      redirect_to products_path, notice: 'Bienvenido a Pepirow '
    else
    flash[:error] = 'Error al autenticar'
    render 'login'   
    end   
  end
  def logout
    session[:client_id] = nil
    redirect_to login_clients_path, notice: 'Volvé'
  end

end