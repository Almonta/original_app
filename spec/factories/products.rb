FactoryBot.define do
  
  factory :product do
    name { 'product1' }
    association :user
  end

  factory :second_product, class: Product do
    name { 'product2' }
  end

  factory :third_product, class: Product do
    name { 'product3' }
  end
end
