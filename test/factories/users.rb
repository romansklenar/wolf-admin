FactoryGirl.define do

  factory :user do
    name { Faker::Name.name }
    email { "#{name.parameterize.gsub('-', '.')}@example.com".downcase }
    password { "topsecret" }
    password_confirmation { |u| u.password }
    locale { User::LOCALE_PAIRS.keys.sample }
    time_zone { User::TIME_ZONE_PAIRS.keys.sample }

    factory :administrator do
      role :administrator
    end

    factory :member do
      role :member
    end
  end

end
