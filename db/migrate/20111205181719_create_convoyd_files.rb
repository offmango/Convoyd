class CreateConvoydFiles < ActiveRecord::Migration
  def change
    create_table :convoyd_files do |t|
      t.integer :user_id
      t.integer :upload_file_size
      t.string :upload_content_type
      t.string :upload_file_name
      t.datetime :upload_updated_at
      t.string :upload

      t.timestamps
    end
  end
end
