class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @item = Item.find(params[:id])
    @comments = @item.comments.includes(:user)
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
   if@item.update(item_params)
      redirect_to item_path(@item)
   else
    render :edit
   end
  end

  def destroy
    if item = Item.find(params[:id])
       item.destroy
       redirect_to root_path
     else
      render :edit
     end
    end



  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end


  private
  def item_params
    params.require(:item).permit(:title, :get_price, :detail, :image).merge(user_id: current_user.id)
  end

end
