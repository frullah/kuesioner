class MahasiswasController < ApplicationController
  before_action :set_mahasiswa, only: [:show, :edit, :update, :destroy]

  # GET /mahasiswas
  def index
    authorize Mahasiswa
    @mahasiswas = Mahasiswa.page(params[:page])
  end

  # GET /mahasiswas/1
  def show
    authorize Mahasiswa
  end

  # GET /mahasiswas/new
  def new
    authorize Mahasiswa
    @mahasiswa = Mahasiswa.new(user: User.new)
  end

  # GET /mahasiswas/1/edit
  def edit
    authorize Mahasiswa
  end

  # POST /mahasiswas
  def create
    authorize Mahasiswa
    @mahasiswa = Mahasiswa.new(mahasiswa_params)

    if @mahasiswa.save
      redirect_to @mahasiswa, notice: "Mahasiswa berhasil dibuat."
    else
      render :new
    end
  end

  # PATCH/PUT /mahasiswas/1
  def update
    authorize Mahasiswa
    if @mahasiswa.update(mahasiswa_params)
      redirect_to @mahasiswa, notice: "Mahasiswa berhasil diubah."
    else
      render :edit
    end
  end

  # DELETE /mahasiswas/1
  def destroy
    authorize Mahasiswa
    @mahasiswa.destroy
    redirect_to mahasiswas_url, notice: "Mahasiswa berhasil dihapus."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_mahasiswa
    @mahasiswa = Mahasiswa.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def mahasiswa_params
    params
      .require(:mahasiswa)
      .permit(:nama, :npm, :prodi_id, user_attributes: [:id, :username, :password])
      .tap do |param|
        if param[:user_attributes][:username].blank?
          param[:user_attributes][:username] = param[:npm]
        end

        if param[:user_attributes][:password].blank?
          param[:user_attributes] = param[:user_attributes].except(:password)
        end
      end
  end
end
