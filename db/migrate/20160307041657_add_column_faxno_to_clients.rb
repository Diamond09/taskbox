class AddColumnFaxnoToClients < ActiveRecord::Migration
  def change
  	add_column :clients , :faxno , :integer
  end
end
