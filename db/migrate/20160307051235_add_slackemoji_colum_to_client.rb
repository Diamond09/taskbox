class AddSlackemojiColumToClient < ActiveRecord::Migration
  def change
  	add_column :clients , :slackemoji, :string 
  end
end
