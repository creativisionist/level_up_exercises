class MenuItemsUserController < ApplicationController
  def mark_as_favorite
    # menu_item_id = MenuItem.where(name: params[:name]).first.id
    MenuItemsUser.create!(user_id: current_user.id, menu_item_id: params[:item])

    redirect_to request.referrer
    flash[:success]
  end

  def unfavorite_item
    # menu_item_id = MenuItem.where(name: params[:name]).first.id
    # menu_items_user_id = MenuItemsUser.find_by(user_id: current_user.id, menu_item_id: params[:item].to_i)
    menu_item = MenuItem.find params[:item]
    current_user.menu_items.destroy(menu_item)

    # menu_items_user_id.destroy
    # MenuItemsUser.delete(menu_items_user_id)

    redirect_to request.referrer
    flash[:success]
  end
end
