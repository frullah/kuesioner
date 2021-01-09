class KuesionerController < ApplicationController
  before_action :authenticate_user!
  
  def isi
    authorize self

    @jadwal = current_user.authenticatable.kelas.name
  end
end
