FactoryBot.define do
  factory :event do
    title {"Вечеринка"}

    address {"Москва"}

    datetime {"Tue, 17 Feb 2023 17:24:00.000000000 UTC +03:00"}

    association :user
  end
end
