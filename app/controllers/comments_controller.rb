class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @item = Item.find(params[:item_id])
    if @comment.save
     redirect_to item_path(@item)
    else
      @comments = @item.comments.includes(:user)
      render "items/show"
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
