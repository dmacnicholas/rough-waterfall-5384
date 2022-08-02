require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe 'relationships' do
    it { should belong_to :supermarket }
    it { should have_many(:items).through(:customer_items) }
    it { should have_many(:customer_items) }
  end

  it 'shows the total price of its items' do
    supermarket_1 = Supermarket.create!(name: "Publix", location: "Nashville, TN")
    supermarket_2 = Supermarket.create!(name: "Trades Joes", location: "Nashville, TN")
    customer_1 = Customer.create!(name: "Drew", supermarket_id: supermarket_1.id)
    item_1 = Item.create!(name: "Steak", price: 20)
    item_2 = Item.create!(name: "Potatoes", price: 10)
    item_3 = Item.create!(name: "Green Beans", price: 6)
    item_4 = Item.create!(name: "Salad", price: 4)
    customer_item_1 = CustomerItem.create(item_id: item_1.id, customer_id: customer_1.id)
    customer_item_1 = CustomerItem.create(item_id: item_2.id, customer_id: customer_1.id)
    customer_item_1 = CustomerItem.create(item_id: item_3.id, customer_id: customer_1.id)

    expect(customer_1.total_price).to eq(36)
  end
end
