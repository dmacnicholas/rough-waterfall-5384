require 'rails_helper'

RSpec.describe 'the supermarket_items index page' do
  it 'shows a list of all unique items' do
    supermarket_1 = Supermarket.create!(name: "Publix", location: "Nashville, TN")
    supermarket_2 = Supermarket.create!(name: "Trades Joes", location: "Nashville, TN")
    customer_1 = Customer.create!(name: "Drew", supermarket_id: supermarket_1.id)
    item_1 = Item.create!(name: "Steak", price: 20)
    item_2 = Item.create!(name: "Potatoes", price: 10)
    item_3 = Item.create!(name: "Green Beans", price: 6)
    item_4 = Item.create!(name: "Salad", price: 4)
    customer_item_1 = CustomerItem.create!(item_id: item_1.id, customer_id: customer_1.id)
    customer_item_2 = CustomerItem.create!(item_id: item_2.id, customer_id: customer_1.id)
    customer_item_3 = CustomerItem.create!(item_id: item_3.id, customer_id: customer_1.id)

     visit "/supermarkets/#{supermarket_1.id}/items"

    expect(page).to have_content("Steak")
    expect(page).to have_content("Potatoes")
    expect(page).to have_content("Green Beans")
  end
end
