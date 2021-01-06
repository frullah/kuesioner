class JadwalMataKuliah < ApplicationRecord
  belongs_to :mata_kuliah
  belongs_to :dosen
  belongs_to :tahun_akademik
  belongs_to :kelas

  validates :hari, presence: true 
  validates :waktu, presence: true 

  enum hari: I18n.t("date.day_names").map(&:to_sym)
end
