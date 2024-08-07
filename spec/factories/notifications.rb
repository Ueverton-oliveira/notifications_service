FactoryBot.define do
  factory :notification do
   message { Faker::Lorem.sentence }
    received_at { Faker::Time.between(from: 2.days.ago, to: Time.now) }
    task_details { Faker::Lorem.paragraph }
    user_data { Faker::Name.name }
  end
end
