FactoryBot.define do
  factory :episode do
    season { nil }
    title { "MyString" }
    plot { "MyText" }
    number { 1 }
  end
end
