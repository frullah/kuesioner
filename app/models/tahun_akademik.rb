class TahunAkademik < ApplicationRecord
  # validates :tahun, presence: true, 

  after_initialize do
    self.ganjil = true if ganjil.nil?
  end

  def semester
    ganjil ? "Ganjil" : "Genap"
  end
end
