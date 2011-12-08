class AddStatusToUsers < ActiveRecord::Migration
  def change
    add_column :users, :status, :string
    add_column :users, :role, :string
    add_column :users, :quota, :float
  end
end
