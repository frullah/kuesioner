FactoryBot.define do
  factory :dosen do
    sequence(:nidn) {  |i| i.to_s.rjust(14, "0") }
    sequence(:nama) {  |i| "nama#{i}" }
    pendidikan { "S1" }
  end
end
