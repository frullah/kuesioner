FactoryBot.define do
  factory :prodi do
    sequence(:nama) { |i| "prodi#{i}" }
  end
end
