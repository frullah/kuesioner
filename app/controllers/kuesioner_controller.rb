class KuesionerController < ApplicationController
  before_action :authenticate_user!
  
  def index
    authorize self

    sql = <<~SQL
      select
        jmk.dosen_id as "dosen_id",
        d.nama as "dosen",
        mk.nama as "mata_kuliah",
        count(rk.id) = (select count(*) from item_kuesioners) as "status",
        jmk.hari as "hari"
      from
        jadwal_mata_kuliahs jmk
      inner join mahasiswas m on
        m.id = :mahasiswa_id
        and m.kelas_id = jmk.kelas_id
      inner join mata_kuliahs mk on
        mk.id = jmk.mata_kuliah_id
      inner join dosens d on
        d.id = jmk.dosen_id
      left join respon_kuesioners rk on
        rk.mahasiswa_id = m.id
        and rk.jadwal_mata_kuliah_id = jmk.id
      group by
        m.id,
        jmk.dosen_id,
        d.nama,
        mk.nama
    SQL
    sql = ApplicationRecord.sanitize_sql_array([
      sql,
      mahasiswa_id: current_user.authenticatable_id
    ]) 
    @list_jadwal = ApplicationRecord.connection.execute(sql)
  end

  def isi
    authorize self
    return redirect_to(kuesioner_path) if params[:jadwal_mata_kuliah_id].blank?

    @list_kategori_kuesioner = KategoriKuesioner
      .all
      .includes(:item_kuesioner)
      .select(:id, :nama)
  end

  def simpan
    authorize self

    jadwal_mata_kuliah_id = params.require(:jadwal_mata_kuliah_id)
    respon_kuesioner = params[:kuesioner]

    if respon_kuesioner.blank? || !(ItemKuesioner.pluck(:id) - respon_kuesioner.keys.map(&:to_i)).blank?
      render status: :bad_request, json: {error: "Lengkapi kuesioner terlebih dahulu"}
      return
    end
    
    ResponKuesioner.transaction do
      respon_kuesioner.each do |(item_kuesioner_id, nilai)|
        nilai = nilai.to_i
        ResponKuesioner.create(
          mahasiswa: current_user.authenticatable,
          jadwal_mata_kuliah_id: jadwal_mata_kuliah_id,
          item_kuesioner_id: item_kuesioner_id,
          nilai: nilai > 4 ? 4 : nilai < 0 ? 0 : nilai
        )
      end
    end

    render json: {success: true, redirect_url: kuesioner_path }
  end

  def tampilkan_hasil
    authorize self

    @list_respon_kuesioner = ResponKuesioner
      .joins([:jadwal_mata_kuliah, item_kuesioner: :kategori_kuesioner])
      .where(jadwal_mata_kuliahs: {dosen_id: current_user.authenticatable_id})
      .group("kategori_kuesioners.nama", "item_kuesioners.pertanyaan")
      .average(:nilai)
  end
end
