class Mahasiswa < ApplicationRecord
  belongs_to :prodi
  belongs_to :kelas
  has_one :user, as: :authenticatable, dependent: :destroy

  has_many :jadwal_mata_kuliah,
    foreign_key: :kelas_id,
    primary_key: :kelas_id

  accepts_nested_attributes_for :user
  accepts_nested_attributes_for :kelas

  validates :nama, presence: true, length: {maximum: 48}
  validates :npm, uniqueness: true, presence: true, length: {maximum: 14}, numericality: {only_integer: true}
end
