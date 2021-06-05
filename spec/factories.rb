FactoryBot.define do
  factory :restaurant do
    name { FFaker::NameFR.name }
    kitchen { "MyString" }
    association :city
    association :location
  end

  factory :location do
    address { FFaker::AddressFR.street_name }
    street_number { rand(1..100) }
    zip_code { FFaker::AddressFR.postal_code }
    association :city    
  end

  factory :city do
    name { 'Amiens' }
  end

  factory :admin do
    email { FFaker::Internet.email }
    password { SecureRandom.hex }
  end

  factory :password do
    content { SecureRandom.hex }
    auth_level { Password.auth_level.values.sample }

    factory :user_password, class: 'Password' do
      auth_level { :user }
    end
  end
end
