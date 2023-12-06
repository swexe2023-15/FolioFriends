class Bookshelf < ApplicationRecord
  belongs_to :user
  serialize :book_api_ids, Array
end
