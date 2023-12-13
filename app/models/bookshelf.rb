class Bookshelf < ApplicationRecord
  belongs_to :user
  serialize :book_api_ids, Array
  
  after_initialize :init

  private

  def init
    self.book_api_ids ||= []
  end
end
