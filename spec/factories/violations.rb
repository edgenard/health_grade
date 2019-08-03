FactoryBot.define do
  factory :violation do
    code { "MyString" }
    description { "MyText" }
    critical_flag { "MyString" }
    health_inspection
  end
end
