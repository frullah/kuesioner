class TahunAkademiksController < ApplicationController
  before_action :set_tahun_akademik, only: [:show, :edit, :update, :destroy]

  # GET /tahun_akademiks
  def index
    @tahun_akademiks = TahunAkademik.all
  end

  # GET /tahun_akademiks/1
  def show
  end

  # GET /tahun_akademiks/new
  def new
    @tahun_akademik = TahunAkademik.new
  end

  # GET /tahun_akademiks/1/edit
  def edit
  end

  # POST /tahun_akademiks
  def create
    @tahun_akademik = TahunAkademik.new(tahun_akademik_params)

    if @tahun_akademik.save
      redirect_to @tahun_akademik, notice: 'Tahun akademik was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /tahun_akademiks/1
  def update
    if @tahun_akademik.update(tahun_akademik_params)
      redirect_to @tahun_akademik, notice: 'Tahun akademik was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /tahun_akademiks/1
  def destroy
    @tahun_akademik.destroy
    redirect_to tahun_akademiks_url, notice: 'Tahun akademik was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tahun_akademik
      @tahun_akademik = TahunAkademik.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def tahun_akademik_params
      params.require(:tahun_akademik).permit(:tahun, :ganjil)
    end
end
