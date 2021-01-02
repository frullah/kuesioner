FactoryBot.define do
  factory :mahasiswa do
    sequence(:npm) { |i| i.to_s.rjust(14, "0") }
    sequence(:nama) { |i| "mahasiswa#{i}" }
    prodi

    after(:create) do |mahasiswa|
      create(:user, authenticatable: mahasiswa)
    end
  end
end
