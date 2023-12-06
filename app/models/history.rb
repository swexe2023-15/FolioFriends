class History < ApplicationRecord
    belongs_to :user
    validates :book_api_id, presence: true
end
