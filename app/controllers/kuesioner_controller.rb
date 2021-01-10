class KuesionerController < ApplicationController
  before_action :authenticate_user!
  
  def index
    authorize self

    sql = <<~SQL
      select
        jmk.id as "dosen_id",
        d.nama as "dosen",
        mk.nama as "mata_kuliah",
        count(rk.id) > 0 as "status"
      from
        jadwal_mata_kuliahs jmk
      inner join mata_kuliahs mk on
        mk.id = jmk.mata_kuliah_id
      inner join dosens d on
        d.id = jmk.id
      left join respon_kuesioners rk on
        rk.mahasiswa_id = :mahasiswa_id
        and rk.dosen_id = jmk.dosen_id
    SQL
    sql = ApplicationRecord.sanitize_sql_array([
      sql,
      mahasiswa_id: current_user.authenticatable_id
    ]) 
    @list_jadwal = ApplicationRecord.connection.execute(sql).to_a
  end

  def isi
    authorize self
    return redirect_to(kuesioner_path) if params[:dosen_id].blank?

    @list_kategori_kuesioner = KategoriKuesioner
      .all
      .includes(:item_kuesioner)
      .select(:id, :nama)
  end

  def simpan
    authorize self

    dosen_id = params.require(:dosen_id)
    respon_kuesioner = params.require(:kuesioner)

    unless (ItemKuesioner.pluck(:id) - respon_kuesioner.keys.map(&:to_i)).blank?
      render status: :bad_request, json: {error: "Lengkapi kuesioner terlebih dahulu"}
      return
    end
    
    ResponKuesioner.transaction do
      respon_kuesioner.each do |(item_kuesioner_id, nilai)|
        nilai = nilai.to_i
        ResponKuesioner.create(
          mahasiswa: current_user.authenticatable,
          dosen_id: dosen_id,
          item_kuesioner_id: item_kuesioner_id,
          nilai: nilai > 4 ? 4 : nilai < 0 ? 0 : nilai
        )
      end
    end

    render json: {success: true, redirect_url: kuesioner_path }
  end
end
