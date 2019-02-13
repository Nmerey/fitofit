FactoryBot.define do
  factory :session do
    email { Faker::Internet.email }
    password_digest { Faker::Internet.password}
  end
end