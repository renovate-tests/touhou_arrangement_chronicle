FactoryBot.define do
  factory :user do
    name { FFaker::Name.unique.html_safe_name.delete(" ").underscore }
    sequence(:email) {|n| "#{name}-#{n}@example.com" }
    password { name }
  end
end
