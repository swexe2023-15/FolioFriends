class User < ApplicationRecord
    has_many :bookshelves
    has_many :histories, dependent: :destroy
    has_many :likes, dependent: :destroy

end
