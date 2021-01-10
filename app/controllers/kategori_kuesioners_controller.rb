class KategoriKuesionersController < ApplicationController
  before_action :set_kategori_kuesioner, only: [:show, :edit, :update, :destroy]

  # GET /kategori_kuesioners
  def index
    authorize KategoriKuesioner
    @kategori_kuesioners = KategoriKuesioner.page(params[:page])
  end

  # GET /kategori_kuesioners/1
  def show
    authorize KategoriKuesioner
  end

  # GET /kategori_kuesioners/new
  def new
    authorize KategoriKuesioner
    @kategori_kuesioner = KategoriKuesioner.new
  end

  # GET /kategori_kuesioners/1/edit
  def edit
    authorize KategoriKuesioner
  end

  # POST /kategori_kuesioners
  def create
    authorize KategoriKuesioner
    @kategori_kuesioner = KategoriKuesioner.new(kategori_kuesioner_params)

    if @kategori_kuesioner.save
      redirect_to @kategori_kuesioner, notice: 'Kategori kuesioner was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /kategori_kuesioners/1
  def update
    authorize KategoriKuesioner
    if @kategori_kuesioner.update(kategori_kuesioner_params)
      redirect_to @kategori_kuesioner, notice: 'Kategori kuesioner was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /kategori_kuesioners/1
  def destroy
    authorize KategoriKuesioner
    @kategori_kuesioner.destroy
    redirect_to kategori_kuesioners_url, notice: 'Kategori kuesioner was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kategori_kuesioner
      @kategori_kuesioner = KategoriKuesioner.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def kategori_kuesioner_params
      params.require(:kategori_kuesioner).permit(:nama)
    end
end
