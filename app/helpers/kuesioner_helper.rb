module KuesionerHelper
  NILAI = {
    4 => "Sangat Baik",
    3 => "Baik",
    2 => "Cukup",
    1 => "Kurang"
  }
  
  def teks_nilai(nilai)
    NILAI[nilai]
  end
end
