FactoryBot.define do
  factory :mata_kuliah do
    prodi
    sequence(:nama) { |i| "mata_kuliah#{i}" }
    sks { 1 }
    semester { 1 }
  end
end
