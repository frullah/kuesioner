class JadwalMataKuliah < ApplicationRecord
  belongs_to :mata_kuliah
  belongs_to :dosen
  belongs_to :tahun_akademik
  belongs_to :kelas
end
