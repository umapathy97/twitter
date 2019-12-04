class AddColumnFollowerToUsers < ActiveRecord::Migration
  def change
  	 add_column :users, :followers, :string
  
  end
end
