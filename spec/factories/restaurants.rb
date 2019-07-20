FactoryBot.define do
  factory :restaurant do
    camis { "" }
    name { "MyString" }
    boro { "MyString" }
    building { 1 }
    street { "MyString" }
    zipcode { 1 }
    phone { 1 }
    cuisine { "MyString" }
  end
end
