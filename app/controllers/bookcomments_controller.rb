class BookcommentsController < ApplicationController
  
  def create
    book = Book.find(params[:book_id])
    comment = current_user.bookcomments.new(bookcomment_params)
    comment.book_id = book.id
    book.save
    redirect_to book_path(book)
  end
  
  private

  def bookcomment_params
    params.require(:bookcomment).permit(:comment)
  end
  
end
