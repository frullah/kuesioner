FactoryBot.define do
  factory :respon_kuesioner do
    mahasiswa
    dosen
    item_kuesioner
    nilai { rand(1..4) }
  end
end
