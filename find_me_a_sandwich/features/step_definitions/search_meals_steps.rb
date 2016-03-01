Given(/^there is another user$/) do
  @another_user = FactoryGirl.create_list(:named_user, 2, profile_visible: true).first
end

Given(/^that user has favorites$/) do
  factory_menu_item = FactoryGirl.create_list(:menu_item, 1)
  @another_user.menu_items << factory_menu_item
end

When(/^I search that user$/) do
  visit "/users"
  click_link(@another_user.email)
end

Then(/^I can see their favorites$/) do
  @another_user.menu_items.each do |menu_item|
    expect(page).to have_content(menu_item.name)
  end
end
