FactoryBot.define do
  factory :sale do
    buyer {Faker::Name.name}
    description {Faker::Commerce.product_name}
    price {Faker::Commerce.price}
    quantity {1}
    address {Faker::Address.street_address}
    supplier {Faker::Name.name}
  end
end
