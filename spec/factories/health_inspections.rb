# frozen_string_literal: true

FactoryBot.define do
  factory :health_inspection do
    inspection_date { "2019-07-20" }
    action { "Violations recorded" }
    score { 1 }
    grade_date { "2019-07-20" }
    restaurant
    grade { "B" }
    inpection_type { "Cycle Inspection" }
  end
end
