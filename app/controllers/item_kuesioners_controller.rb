class ItemKuesionersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item_kuesioner, only: [:show, :edit, :update, :destroy]

  # GET /item_kuesioners
  def index
    @item_kuesioners = ItemKuesioner.all
  end

  # GET /item_kuesioners/1
  def show
  end

  # GET /item_kuesioners/new
  def new
    @item_kuesioner = ItemKuesioner.new
  end

  # GET /item_kuesioners/1/edit 
  def edit
  end

  # POST /item_kuesioners
  def create
    @item_kuesioner = ItemKuesioner.new(item_kuesioner_params)

    if @item_kuesioner.save
      redirect_to @item_kuesioner, notice: 'Item kuesioner was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /item_kuesioners/1
  def update
    if @item_kuesioner.update(item_kuesioner_params)
      redirect_to @item_kuesioner, notice: 'Item kuesioner was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /item_kuesioners/1
  def destroy
    @item_kuesioner.destroy
    redirect_to item_kuesioners_url, notice: 'Item kuesioner was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item_kuesioner
      @item_kuesioner = ItemKuesioner.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def item_kuesioner_params
      params.require(:item_kuesioner).permit(:kategori_kuesioner_id, :pertanyaan)
    end
end
