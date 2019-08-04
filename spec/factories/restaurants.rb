# frozen_string_literal: true

FactoryBot.define do
  factory :restaurant do
    camis { 12_345_678 }
    name { "Moe's" }
    boro { "Manhattan" }
    building { 1 }
    street { "East 86th Street" }
    zipcode { 10_001 }
    phone { 2_125_551_234 }
    cuisine { "Deli" }
  end
end
