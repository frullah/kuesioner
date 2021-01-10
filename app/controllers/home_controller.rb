class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    case current_user.authenticatable_type
    when "Mahasiswa"
      redirect_to kuesioner_path
    end
  end
end
