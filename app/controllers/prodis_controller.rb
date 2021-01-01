class ProdisController < ApplicationController
  before_action :set_prodi, only: [:show, :edit, :update, :destroy]

  # GET /prodis
  def index
    @prodis = Prodi.all
  end

  # GET /prodis/1
  def show
  end

  # GET /prodis/new
  def new
    @prodi = Prodi.new
  end

  # GET /prodis/1/edit
  def edit
  end

  # POST /prodis
  def create
    @prodi = Prodi.new(prodi_params)

    if @prodi.save
      redirect_to @prodi, notice: 'Prodi was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /prodis/1
  def update
    if @prodi.update(prodi_params)
      redirect_to @prodi, notice: 'Prodi was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /prodis/1
  def destroy
    @prodi.destroy
    redirect_to prodis_url, notice: 'Prodi was successfully destroyed.'
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
