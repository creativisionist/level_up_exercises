Given(/^I have favorited meals$/) do
  factory_menu_item = FactoryGirl.create_list(:menu_item, 1)
  @user.menu_items << factory_menu_item
end

When(/^I visit my favorites$/) do
  visit "/favorites"
end

Then(/^I see my favorite meals$/) do
  @user.menu_items.each do |menu_item|
    expect(page).to have_content(menu_item.name)
  end
end

Given(/^I visit a merchant page$/) do
  starbucks_menu = find('div.panel-heading', text: 'Starbucks')
  within starbucks_menu do
    click_on('See More')
  end
end

When(/^I favorite a menu item$/) do
  starbucks_menu_item = find('tr', text: 'Apple Fritter')
  within starbucks_menu_item do
    click_on('Favorite me')
  end
end

Then(/^I see the item is a favorite$/) do
  find('li', text: 'Apple Fritter').has_content?('Unfavorite Me')
end

When(/^I unfavorite that item$/) do
  starbucks_menu_item = find('tr', text: 'Apple Fritter')
  within starbucks_menu_item do
    click_on('Unfavorite me')
  end
end

Then(/^I see the item is no longer a favorite$/) do
  find('tr', text: 'Apple Fritter').has_content?('Favorite Me')
end
