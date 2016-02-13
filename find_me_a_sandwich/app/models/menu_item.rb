class MenuItem < ActiveRecord::Base
  belongs_to :menu
  has_and_belongs_to_many :users

  validates_presence_of :name, :menu

  validates_absence_of :menu_subgroup, if: (lambda do |item|
    item.menu_group.present?
  end)

  default_scope -> { includes(:menu) }
  scope :merchant_id, -> { Merchant.find(menu.merchant_id) }
end
