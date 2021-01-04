FactoryBot.define do
  factory :kategori_kuesioner do
    sequence(:nama) { |i| "nama#{i}" }
  end
end
