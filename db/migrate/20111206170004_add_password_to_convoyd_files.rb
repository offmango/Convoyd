class AddPasswordToConvoydFiles < ActiveRecord::Migration
  def change
    add_column :convoyd_files, :crypted_password, :string
    add_column :convoyd_files, :convoyd_key, :string
    add_column :convoyd_files, :status, :string
  end
end
