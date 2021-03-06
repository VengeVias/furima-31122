FactoryBot.define do
  factory :user do
    nickname {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6, mix_case: true)
    password {password}
    password_confirmation {password}
    firstname {"山田"}
    lastname {"太郎"}
    firstname_kana {"ヤマダ"}
    lastname_kana {"タロウ"}
    birthday {Faker::Date.birthday}
  end
end
