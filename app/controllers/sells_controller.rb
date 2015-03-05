class SellsController < ApplicationController

  #sells/index
  def index
  	@sells=Sell.all
  end

  #sells/123
  def show
  	@sell = Sell.find(params[:id])
  end
end
