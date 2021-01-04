FactoryBot.define do
  factory :kelas do
    sequence(:nama) { |i| "nama#{i}" }
    prodi
  end
end
