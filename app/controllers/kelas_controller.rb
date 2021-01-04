class KelasController < ApplicationController
  before_action :set_kelas, only: [:show, :edit, :update, :destroy]

  # GET /kelas
  def index
    @kelas = Kelas.all
  end

  # GET /kelas/1
  def show
  end

  # GET /kelas/new
  def new
    @kelas = Kelas.new
  end

  # GET /kelas/1/edit
  def edit
  end

  # POST /kelas
  def create
    @kelas = Kelas.new(kelas_params)

    if @kelas.save
      redirect_to @kelas, notice: 'Kelas was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /kelas/1
  def update
    if @kelas.update(kelas_params)
      redirect_to @kelas, notice: 'Kelas was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /kelas/1
  def destroy
    @kelas.destroy
    redirect_to kelas_index_url, notice: 'Kelas was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kelas
      @kelas = Kelas.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def kelas_params
      params.require(:kelas).permit(:nama, :prodi_id)
    end
end
