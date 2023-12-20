class AddUserIdToHistories < ActiveRecord::Migration[7.0]
  def change
    add_reference :histories, :user, null: false, foreign_key: true
  end
end
