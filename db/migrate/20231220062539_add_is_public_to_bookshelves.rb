class AddIsPublicToBookshelves < ActiveRecord::Migration[7.0]
  def change
    add_column :bookshelves, :is_public, :boolean, :default => false
  end
end
