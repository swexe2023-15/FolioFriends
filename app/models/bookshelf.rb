class Bookshelf < ApplicationRecord
    has_many :books
    has_many :likes
    belongs_to :user
end
