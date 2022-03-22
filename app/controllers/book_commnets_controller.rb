class BookCommnetsController < ApplicationController

  def create
    @book_comment = BookComment.new(book_comment_params)
    @book_commnet.user_id = current_user.id
    @book_comment.book_id = params[:book_id]
    if @book_comment.save
      redirect_to book_path(@book_comment.book_id)
    else
      @book = Book.find(params[:book_id])
      @user = @book_comment.user
      @book_r = Book.new
      render book_path(params[:book_id])
    end
  end

  def destroy

  end

  private
  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
end
