module MataKuliahsHelper
  def prodi_options
    Prodi.pluck(:nama, :id)
  end
end
