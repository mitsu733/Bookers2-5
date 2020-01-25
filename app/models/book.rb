class Book < ApplicationRecord
	
	validates :title, length: { in: 1..200 }
	validates :body, length: { in: 1..200 }


	belongs_to :user
end
