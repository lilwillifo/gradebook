FactoryBot.define do
  factory :student, class: User do
    username 'Margaret'
    password 'test'
    password_confirmation 'test'
    role 0
  end
  factory :teacher, class: User do
    username 'Megan'
    password 'test'
    password_confirmation 'test'
    role 1
  end

  factory :admin, class: User do
    username 'Ian'
    password 'test'
    password_confirmation 'test'
    role 2
  end
end
