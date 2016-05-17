class RenameBudget < ActiveRecord::Migration
  def change
  	rename_column :projects, :budget, :allocated_budget
  end
end
