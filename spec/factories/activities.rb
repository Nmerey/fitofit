FactoryBot.define do
  factory :activity do
    distance { rand(1..20) }
  end
end