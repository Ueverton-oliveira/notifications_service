FactoryBot.define do
  factory :notification do
    task_id { 1 }
    task_name { "MyString" }
    task_description { "MyText" }
    user_id { 1 }
    action { "MyString" }
  end
end
