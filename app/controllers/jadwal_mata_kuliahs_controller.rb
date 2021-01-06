class JadwalMataKuliahsController < ApplicationController
  before_action :set_jadwal_mata_kuliah, only: [:show, :edit, :update, :destroy]

  # GET /jadwal_mata_kuliahs
  def index
    @jadwal_mata_kuliahs = JadwalMataKuliah.all
  end

  # GET /jadwal_mata_kuliahs/1
  def show
  end

  # GET /jadwal_mata_kuliahs/new
  def new
    @jadwal_mata_kuliah = JadwalMataKuliah.new
  end

  # GET /jadwal_mata_kuliahs/1/edit
  def edit
  end

  # POST /jadwal_mata_kuliahs
  def create
    @jadwal_mata_kuliah = JadwalMataKuliah.new(jadwal_mata_kuliah_params)

    if @jadwal_mata_kuliah.save
      redirect_to @jadwal_mata_kuliah, notice: 'Jadwal mata kuliah was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /jadwal_mata_kuliahs/1
  def update
    if @jadwal_mata_kuliah.update(jadwal_mata_kuliah_params)
      redirect_to @jadwal_mata_kuliah, notice: 'Jadwal mata kuliah was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /jadwal_mata_kuliahs/1
  def destroy
    @jadwal_mata_kuliah.destroy
    redirect_to jadwal_mata_kuliahs_url, notice: 'Jadwal mata kuliah was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_jadwal_mata_kuliah
      @jadwal_mata_kuliah = JadwalMataKuliah.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def jadwal_mata_kuliah_params
      params
        .require(:jadwal_mata_kuliah)
        .permit(:mata_kuliah_id, :dosen_id, :tahun_akademik_id, :kelas_id, :hari, :waktu)
        .tap do |param|
          param[:hari] = param[:hari].to_i
        end
    end
end
