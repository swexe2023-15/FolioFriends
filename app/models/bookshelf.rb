class Bookshelf < ApplicationRecord
    has_many :likes
    belongs_to :user
end
