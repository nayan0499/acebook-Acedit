FactoryBot.define do
    factory :user do
      email { 'john@gmail.com' }
      password  { '123456' }
      username { '123456' }
      age { 13 }
    end
end 