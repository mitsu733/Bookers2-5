class SearchesController < ApplicationController
	before_action :authenticate_user!

	def search
		@booknew = Book.new
		@users = current_user
		method = params[:search_method]
		word = params[:search_word]
		if  params[:search_range] == "user"
		    @searches = User.user_search(method,word)
		    render "index"
		 else
		 	params[:search_range] == "book"
		    @searches = Book.book_search(method,word)
		    render "show"
		 end
	end


# 以下モデルへ
	# private

	# def user_search(range,method,word)
	# 	if range == "user"
	# 	    if method == "forward_match"
	# 	            @users = User.where("text LIKE?","#{word}%")
	# 	    elsif method == "backward_match"
	# 	            @users = User.where("text LIKE?","%#{word}")
	# 	    elsif method == "perfect_match"
	# 	            @users = User.where("#{word}")
	# 	    elsif method == "partial_match"
	# 	            @users = User.where("text LIKE?","%#{word}%")
	# 	    else
	# 	            @users = User.all
	# 	    end
	# 	else
	# 		if method == "forward_match"
	# 	            @books = Book.where("text LIKE?","#{word}%")
	# 	    elsif method == "backward_match"
	# 	            @books = Book.where("text LIKE?","%#{word}")
	# 	    elsif method == "perfect_match"
	# 	            @books = Book.where("#{word}")
	# 	    elsif method == "partial_match"
	# 	            @books = Book.where("text LIKE?","%#{word}%")
	# 	    else
	# 	            @books = Book.all
	# 	    end
	# 	end
	# end
end
