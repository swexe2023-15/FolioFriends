class User < ApplicationRecord
  has_many :bookshelves
  has_many :histories, dependent: :destroy
  has_many :likes, dependent: :destroy
  
  validates :password, presence: true, confirmation: true

  attr_accessor :password, :password_confirmation

  def password=(val)
    if val.present?
      self.pass = BCrypt::Password.create(val)
    end
    @password = val
  end

  after_create :create_favorite_shelf
  after_create :create_history_shelf
  
  def favorite_shelf
    bookshelves.find_by(shelfname: 'お気に入り')
  end

  def history_shelf
    bookshelves.find_by(shelfname: '履歴')
  end

  private

  def create_favorite_shelf
    bookshelves.create(shelfname: 'お気に入り')
  end
  
  def create_history_shelf
    bookshelves.create(shelfname: '履歴')
  end
end