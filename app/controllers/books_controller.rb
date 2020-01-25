class BooksController < ApplicationController
	before_action :authenticate_user!, except: [:home]

	def home
	end

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
		@booknew = Book.new
		@book = Book.find(params[:id])
		@userself = current_user
	end

	def edit
		@book = Book.find(params[:id])
	end

	def update
			book = Book.find(params[:id])
			book.update(book_params)
			redirect_to book, notice: "successfully !"
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