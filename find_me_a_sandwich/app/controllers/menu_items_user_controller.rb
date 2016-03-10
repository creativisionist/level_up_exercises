class MenuItemsUserController < ApplicationController
  def mark_as_favorite
    MenuItemsUser.create!(user_id: current_user.id, menu_item_id: params[:item])

    redirect_to request.referrer
    flash[:success]
  end

  def unfavorite_item
    menu_item = MenuItem.find params[:item]
    current_user.menu_items.destroy(menu_item)

    redirect_to request.referrer
    flash[:success]
  end
end
