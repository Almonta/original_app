FactoryBot.define do
  factory :product_document do
    name { 'product_document1' }
    content { 'product_document_content1' }
    public_level { 0 }
    document { File.open("#{Rails.root}/spec/factories/RSpec_test.jpg") }
    association :user
    association :product
  end

  factory :second_product_document, class: ProductDocument do
    name { 'product_document2' }
    content { 'product_document_content2' }
    public_level { 0 }
    document { File.open("#{Rails.root}/spec/factories/RSpec_test.jpg") }
    association :user
    association :product
  end

  factory :third_product_document, class: ProductDocument do
    name { 'product_document3' }
    content { 'product_document_content3' }
    public_level { 1 }
    document { File.open("#{Rails.root}/spec/factories/RSpec_test.jpg") }
    association :user
    association :product
  end

  factory :fourth_product_document, class: ProductDocument do
    name { 'product_document4' }
    content { 'product_document_content4' }
    public_level { 1 }
    document { File.open("#{Rails.root}/spec/factories/RSpec_test.jpg") }
    association :user
    association :product
  end
end
