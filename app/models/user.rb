class User < ApplicationRecord
    has_many :bookshelves
    has_many :histories, dependent: :destroy
    has_many :likes, dependent: :destroy

    def password=(val)
        if val.present?
            self.pass = BCrypt::Password.create(val)
        end
        @password = val
    end
end
