class AddAdminToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :admin, :boolean, :default => false
    #Ex:- :default =>''
  end
end
