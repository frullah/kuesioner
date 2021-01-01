FactoryBot.define do
  factory :user do
    sequence(:username) { |n| "username#{n}" }
    sequence(:password) { |n| "password#{n}" }
    sequence(:email) { |n| "user#{n}@domain.tld" }

    trait :admin do
      authenticatable factory: :admin
    end

    trait :mahasiswa do
      authenticatable factory: :mahasiswa
    end

    trait :dosen do
      authenticatable factory: :dosen
    end
  end
end
