class ChangeColumnType < ActiveRecord::Migration
  def change
  	change_column :projects ,:allocated_budget, :integer
  end
end
