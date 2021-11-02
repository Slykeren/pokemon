class ItemsController < ApplicationController
  def index
    
    @items = Item.all
  end

  #show by id
  def show
    @item = Item.find(params[:id])
  end

end
