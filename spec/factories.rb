FactoryBot.define do
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
