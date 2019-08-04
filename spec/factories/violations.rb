# frozen_string_literal: true

FactoryBot.define do
  factory :violation do
    code { "08C" }
    description { "Health violation" }
    critical_flag { "Critical" }
    health_inspection
  end
end
