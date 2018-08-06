FactoryBot.define do
  factory :student, class: User do
    sequence(:id) { |number| number }
    sequence(:username) { |n| "student#{n}" }
    password 'test'
    password_confirmation 'test'
    role 0
  end
  factory :teacher, class: User do
    sequence(:id) { |number| number }
    sequence(:username) { |n| "teacher#{n}" }
    password 'test'
    password_confirmation 'test'
    role 1
  end

  factory :admin, class: User do
    sequence(:id) { |number| number }
    sequence(:username) { |n| "admin#{n}" }
    password 'test'
    password_confirmation 'test'
    role 2
  end
end
