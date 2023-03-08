FactoryBot.define do
  factory :purchase_option do
    association :content, factory: :movie
    price { "9.99" }
    quality { "sd" }
  end
end
