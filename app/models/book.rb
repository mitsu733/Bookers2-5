class Book < ApplicationRecord
	
	validates :title, presence: true, length: { maximum: 20 }
	validates :body, presence: true, length: { maximum: 200 }


	belongs_to :user
	has_many :book_comments, dependent: :destroy
	has_many :favorites, dependent: :destroy
	
	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end
	
	def self.book_search(method,word)
		if method == "forward_match"
	        Book.where("title LIKE?","#{word}%")
	    elsif method == "backward_match"
	         Book.where("title LIKE?","%#{word}")
	    elsif method == "perfect_match"
	         Book.where(title: "#{word}")
	    elsif method == "partial_match"
	         Book.where("title LIKE?","%#{word}%")
	    else
	         Book.all
	    end
	end
end
