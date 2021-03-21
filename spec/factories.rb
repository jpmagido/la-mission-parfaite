FactoryBot.define do
  factory :admin do
    email { FFaker::Internet.email}
    password { SecureRandom.hex }
  end

  factory :password do
    content { SecureRandom.hex }
    auth_level { Password.auth_level.values.sample}
  end
end
