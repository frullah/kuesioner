class MataKuliahsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_mata_kuliah, only: [:show, :edit, :update, :destroy]

  # GET /mata_kuliahs
  def index
    authorize MataKuliah
    @mata_kuliahs = MataKuliah.page(params[:page])
  end

  # GET /mata_kuliahs/1
  def show
    authorize MataKuliah
  end

  # GET /mata_kuliahs/new
  def new
    authorize MataKuliah
    @mata_kuliah = MataKuliah.new
  end

  # GET /mata_kuliahs/1/edit
  def edit
    authorize MataKuliah
  end

  # POST /mata_kuliahs
  def create
    authorize MataKuliah
    @mata_kuliah = MataKuliah.new(mata_kuliah_params)

    if @mata_kuliah.save
      redirect_to @mata_kuliah, notice: "Mata kuliah berhasil dibuat."
    else
      render :new
    end
  end

  # PATCH/PUT /mata_kuliahs/1
  def update
    authorize MataKuliah
    if @mata_kuliah.update(mata_kuliah_params)
      redirect_to @mata_kuliah, notice: "Mata kuliah berhasil diubah."
    else
      render :edit
    end
  end

  # DELETE /mata_kuliahs/1
  def destroy
    authorize MataKuliah
    @mata_kuliah.destroy
    redirect_to mata_kuliahs_url, notice: "Mata kuliah berhasil dihapus."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_mata_kuliah
    @mata_kuliah = MataKuliah.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def mata_kuliah_params
    params.require(:mata_kuliah).permit(:nama, :prodi_id, :sks, :semester)
  end
end
