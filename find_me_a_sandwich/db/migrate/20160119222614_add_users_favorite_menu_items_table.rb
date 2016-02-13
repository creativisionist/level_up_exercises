class AddUsersFavoriteMenuItemsTable < ActiveRecord::Migration
  def change
    create_join_table :users, :menu_items
  end
end
