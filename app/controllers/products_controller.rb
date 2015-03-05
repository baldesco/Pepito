class ProductsController < ApplicationController
  before_action :login_required
  before_action :load_client, only:[:show, :edit, :update, :destroy]
  before_action :products_params, only: [:create]

  def products_params
   params.require(:product).permit(:ref, :price, :quantity, :brand, :name, :description, :size, :color)
  end


  def load_client
    @product=Product.find(params[:id])
  end

  #products/index
  def index
  	@products=Product.all
  	#puts "#{@clients.inspect}"
  end

  #clients/123
  def show
  end

  #clints/new
  def new
	@product=Product.new  	
  end

  #clients/create
  def create
  	params_filtered=params.require(:product).permit(:ref,:description,:brand,:price,:quantity,:size)
  	@product=Product.new(params_filtered)
  	if @product.save
  		redirect_to products_path
  	else
  		render 'new'
  	end
  end

  def edit
    
  end

  #products/update
  def update
    params_filtered=params.require(:product).permit(:ref,:description,:brand,:price,:quantity,:size)
    if @product.update(params_filtered)
      redirect_to products_path
    else
      render 'edit'
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path, notice: 'Producto eliminado'
  end

end
