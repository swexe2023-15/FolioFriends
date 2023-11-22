class User < ApplicationRecord
    has_many :bookshelves
    has_many :histories, dependent: :destroy
    has_many :likes, dependent: :destroy
    has_many :like_books, source: :books, through: :likes
end
