class DeleteTableVendors < ActiveRecord::Migration
  def change
  	drop_table :Vendors
  end
end
