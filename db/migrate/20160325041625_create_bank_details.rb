class CreateBankDetails < ActiveRecord::Migration
  def change
    create_table :bank_details do |t|
      t.integer :client_id
      t.string :acc_no
      t.string :bank_name
      t.string :tin_number

      t.timestamps null: false
    end
  end
end
