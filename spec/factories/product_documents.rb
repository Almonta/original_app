FactoryBot.define do
  factory :product_document do
    name { 'test1' }
    content { 'test1' }
    document { 'test1' }
    public_level { 0 }
    association :user
    association :product
  end

  factory :second_product_document, class: ProductDocument do
    name { 'test2' }
    content { 'test2' }
    document { 'test2' }
    public_level { 0 }
    association :user
    association :product
  end

  factory :third_product_document, class: ProductDocument do
    name { 'test3' }
    content { 'test3' }
    document { 'test3' }
    public_level { 0 }
    association :user
    association :product
  end
end
