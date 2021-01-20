class UsersController < ApplicationController

  def index
    @items = Item.all
  end

  def show
    @user = User.find(params[:id])
  end

  private
  def item_params
    params.require(:item).permit(:title, :get_price, :detail, :image).merge(user_id: current_user.id)
  end
  
end
