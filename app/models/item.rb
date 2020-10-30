class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category, :condition, :delivery_charge, :prefecture, :days_to_ship

  validates :name, :description, :category_id, :condition_id, :delivery_charge_id, :prefecture_id, :days_to_ship_id, :price, :user, presence: true
  validates :category_id, :condition_id, :delivery_charge_id, :prefecture_id, :days_to_ship_id, numericality: { other_than: 1 }
end
