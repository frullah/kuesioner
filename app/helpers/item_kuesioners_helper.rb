module ItemKuesionersHelper
  def kategori_kuesioner_options
    KategoriKuesioner.pluck(:nama, :id)
  end
end
