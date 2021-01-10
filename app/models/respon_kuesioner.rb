class ResponKuesioner < ApplicationRecord
  belongs_to :mahasiswa
  belongs_to :dosen
  belongs_to :item_kuesioner

  validates :mahasiswa, uniqueness: {scope: [:dosen_id, :item_kuesioner_id]}
end
