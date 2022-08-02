class Supermarket < ApplicationRecord
  has_many :customers
  has_many :customer_items, through: :customers
  has_many :items, through: :customer_items

  def unique_items
    items.distinct
  end

  def top_3_items
    items
    .select('items.*, count(items.*) as customer_popularity')
    .group(:id)
    .order('customer_popularity desc')
    .limit(3)

  end
end
