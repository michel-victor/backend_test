FactoryBot.define do
  factory :episode do
    association :season, factory: :season
    title { "My episode" }
    plot { "My episode is awesome." }
    number { 1 }
  end
end
