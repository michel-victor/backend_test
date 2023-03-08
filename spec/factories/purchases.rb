FactoryBot.define do
  factory :purchase do
    association :user, factory: :user
    association :purchase_option, factory: :purchase_option
  end
end
