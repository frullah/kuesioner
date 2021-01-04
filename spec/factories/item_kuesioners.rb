FactoryBot.define do
  factory :item_kuesioner do
    kategori_kuesioner
    sequence(:pertanyaan) { |i| "pertanyaan#{i}" }
  end
end
