class AddBookApiIdsToBookshelves < ActiveRecord::Migration[7.0]
  def change
    add_column :bookshelves, :book_api_ids, :text
  end
end
