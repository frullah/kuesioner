class MataKuliah < ApplicationRecord
  belongs_to :prodi

  validates :nama, presence: true
  validates :sks, presence: true, numericality: { only_integer: true, greater_than: 0, less_than: 10 }
  validates :semester, presence: true, numericality: { only_integer: true, greater_than: 0, less_than: 14 }
end
