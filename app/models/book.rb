class Book < ApplicationRecord
    has_many :likes, dependent: :destroy
    has_many :like_users, source: :user, through: :likes
    has_many :histories, dependent: :destroy
    has_many :bookshelves
end
