class MataKuliah < ApplicationRecord
  validates :nama, presence: true, uniqueness: true
  validates :sks, presence: true, numericality: { only_integer: true, greater_than: 0, less_than: 10 }
  validates :semester, presence: true, numericality: { only_integer: true, greater_than: 0, less_than: 14 }
end
