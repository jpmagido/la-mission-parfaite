# frozen_string_literal: true

FactoryBot.define do
  factory :housing do
    breakfast { [true, false].sample }
    association :city
    association :location
    url { FFaker::Internet.http_url }
    housing_type { 1 }
  end
  
  factory :restaurant do
    name { FFaker::NameFR.name }
    kitchen { FFaker::Lorem.name }
    delivery { ['uber', 'deliveroo'] }
    vegan { [true, false].sample }
    association :city
    association :location
  end
  
  factory :admin_review do
    first_name { 'Jean' }
    last_name { 'Dupond' }
    email { FFaker::Internet.email }
    comment { FFaker::Lorem.name }
    status { 'todo' }
    association :admin
    association :reviewable, factory: [:housing, :restaurant]
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
