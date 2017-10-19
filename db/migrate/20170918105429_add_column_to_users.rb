class AddColumnToUsers < ActiveRecord::Migration[5.1]
  def up
    change_column :users, :admin, :boolean, :default => false
  end
end
