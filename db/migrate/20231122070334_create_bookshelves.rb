class CreateBookshelves < ActiveRecord::Migration[7.0]
  def change
    create_table :bookshelves do |t|
      t.string :shelfname

      t.timestamps
    end
  end
end
