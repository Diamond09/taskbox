class AddUserIdsToTables < ActiveRecord::Migration
  def change
  	add_column :clients,:user_id,:integer
  	add_column :projects,:user_id,:integer
  	add_column :tasks,:user_id,:integer
  end
end
