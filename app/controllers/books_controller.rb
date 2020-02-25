class BooksController < ApplicationController
	before_action :authenticate_user!



	def create
			@booknew = Book.new(book_params)
			@booknew.user_id = current_user.id
		if  @booknew.save
			redirect_to @booknew, notice: "successfully !"
		else
			@book = Book.all
			@users = current_user
			render :index
		end
	end

	def index
		@booknew = Book.new
		@book = Book.all
		@users = current_user
	end

	def show
		@book_comment = BookComment.new
		@book_comments = BookComment.where(book_id: params[:id])
		@booknew = Book.new
		@book = Book.find(params[:id])
		@user = @book.user
	end

	def edit
		@book = Book.find(params[:id])
	if	@book.user_id != current_user.id
		redirect_to books_path
	end
	end

	def update
			@book = Book.find(params[:id])
		if	@book.update(book_params)
			redirect_to book_path(@book), notice: "successfully !"
		else
			render :edit
		end
	end

	def destroy
		@book = Book.find(params[:id])
		@book.destroy
		redirect_to books_path
	end

	private

	def book_params
		params.require(:book).permit(:title, :body)
	end
end