class BookCommentsController < ApplicationController
def create
	@book = Book.find(params[:book_comment][:book_id])
	@book_comment = BookComment.new(book_comment_params)
	@book_comment.book_id = params[:book_comment][:book_id]
	@book_comment.user_id = current_user.id
if	@book_comment.save
	redirect_to book_path(params[:book_comment][:book_id])
else
	@userself = current_user
	@booknew = Book.new
	@book_comments = BookComment.where(book_id: params[:book_comment][:book_id])
	render "books/show"
end
end

def destroy
	book_comment = BookComment.find(params[:id])
	book = book_comment.book
	book_comment.destroy
	redirect_to book_path(book.id)
end

private

def book_comment_params
	params.require(:book_comment).permit(:comment)
end

end
