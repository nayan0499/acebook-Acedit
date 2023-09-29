FactoryBot.define do
    factory :user do
      email { 'john@gmail.com' }
      password  { '123456' }
      username { '123456' }
      isAgeOver13 { true }
      agreed_to_terms { true }
    end
end 