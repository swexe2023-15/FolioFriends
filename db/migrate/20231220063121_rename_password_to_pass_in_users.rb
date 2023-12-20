class RenamePasswordToPassInUsers < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :password, :pass
  end
end
