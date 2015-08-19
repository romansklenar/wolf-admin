FactoryGirl.define do

  factory :user do
    first_name { Faker::Name.first_name }
    last_name  { Faker::Name.last_name }
    email      { "#{first_name}.#{last_name}@example.com".downcase }
    password   { "topsecret" }
    password_confirmation { |u| u.password }
    locale    { User::LOCALE_PAIRS.keys.sample }
    time_zone { User::TIME_ZONE_PAIRS.keys.sample }

    factory :administrator do
      role :administrator
    end

    factory :member do
      role :member
    end
  end

end
