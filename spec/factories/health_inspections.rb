FactoryBot.define do
  factory :health_inspection do
    inspection_date { "2019-07-20" }
    action { "MyText" }
    violation_code { "MyString" }
    violation_description { "MyText" }
    critical_flag { "MyString" }
    score { 1 }
    grade_date { "2019-07-20" }
    restaurant { "" }
  end
end
