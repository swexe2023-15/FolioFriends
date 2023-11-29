class CreateHistories < ActiveRecord::Migration[7.0]
  def change
    create_table :histories do |t|
      t.string :book_api_id
      t.timestamps
    end
  end
end
