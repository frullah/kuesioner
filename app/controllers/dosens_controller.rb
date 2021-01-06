class DosensController < ApplicationController
  before_action :authenticate_user!
  before_action :set_dosen, only: [:show, :edit, :update, :destroy]

  # GET /dosens
  def index
    @dosens = Dosen.all
  end

  # GET /dosens/1
  def show
  end

  # GET /dosens/new
  def new
    @dosen = Dosen.new(user: User.new)
  end

  # GET /dosens/1/edit
  def edit
  end

  # POST /dosens
  def create
    @dosen = Dosen.new(dosen_params)

    if @dosen.save
      redirect_to @dosen, notice: 'Dosen berhasil dibuat.'
    else
      render :new
    end
  end

  # PATCH/PUT /dosens/1
  def update
    if @dosen.update(dosen_params)
      redirect_to @dosen, notice: 'Dosen berhasil diubah.'
    else
      render :edit
    end
  end

  # DELETE /dosens/1
  def destroy
    @dosen.destroy
    redirect_to dosens_url, notice: 'Dosen berhasil dihapus.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_dosen
    @dosen = Dosen.find(params[:id])
    @dosen.build_user if @dosen.user.nil?
  end

    # Only allow a trusted parameter "white list" through.
    def dosen_params
      params
        .require(:dosen)
        .permit(:nidn, :nama, :pendidikan, user_attributes: {})
        .tap do |param|
          if param[:user_attributes][:username].blank?
            param[:user_attributes][:username] = param[:nidn]
          end

          if param[:user_attributes][:password].blank?
            param[:user_attributes] = param[:user_attributes].except(:password)
          end
        end
    end
end
