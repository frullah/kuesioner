class ResponKuesioner < ApplicationRecord
  belongs_to :mahasiswa
  belongs_to :jadwal_mata_kuliah
  belongs_to :item_kuesioner

  validates :mahasiswa, uniqueness: {scope: [:jadwal_mata_kuliah_id, :item_kuesioner_id]}
end
