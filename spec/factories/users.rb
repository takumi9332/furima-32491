FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {"111aaa"}
    password_confirmation {password}
    last_name             {"山田"}
    first_name            {"太郎"}
    last_name_kana        {"アアアアア"}
    first_name_kana       {"アアアアア"}
    birth_date            {Faker::Date.birthday(min_age: 18, max_age: 65)}
  end
end