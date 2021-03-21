FactoryBot.define do
  factory :admin do
    email { FFaker::Internet.email}
    password { 'blablabla' }
  end

  factory :password do
    content { 'blobloblo' }
    auth_level { Password.auth_level.values.sample}
  end
end
