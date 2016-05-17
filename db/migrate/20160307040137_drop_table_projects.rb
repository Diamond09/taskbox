class DropTableVendors < ActiveRecord::Migration
  def change
drop_table :Vendors
  end
end
