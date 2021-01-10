class ProdisController < ApplicationController
  before_action :authenticate_user!
  before_action :set_prodi, only: [:show, :edit, :update, :destroy]

  # GET /prodis
  def index
    authorize Prodi
    @prodis = Prodi.page(params[:page])
  end

  # GET /prodis/1
  def show
    authorize Prodi
  end

  # GET /prodis/new
  def new
    authorize Prodi
    @prodi = Prodi.new
  end

  # GET /prodis/1/edit
  def edit
    authorize Prodi
  end

  # POST /prodis
  def create
    authorize Prodi
    @prodi = Prodi.new(prodi_params)

    if @prodi.save
      redirect_to @prodi, notice: "Prodi berhasil dibuat."
    else
      render :new
    end
  end

  # PATCH/PUT /prodis/1
  def update
    authorize Prodi
    if @prodi.update(prodi_params)
      redirect_to @prodi, notice: "Prodi berhasil diubah."
    else
      render :edit
    end
  end

  # DELETE /prodis/1
  def destroy
    authorize Prodi
    @prodi.destroy
    redirect_to prodis_url, notice: "Prodi berhasil dihapus."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_prodi
    @prodi = Prodi.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def prodi_params
    params.require(:prodi).permit(:nama)
  end
end
