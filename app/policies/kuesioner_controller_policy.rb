class KuesionerControllerPolicy < ApplicationPolicy
  def index?
    user.authenticatable_type == "Mahasiswa"
  end

  def isi?
    user.authenticatable_type == "Mahasiswa"
  end

  def simpan?
    user.authenticatable_type == "Mahasiswa"
  end

  def tampilkan_hasil?
    user.authenticatable_type == "Dosen"
  end
  
  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
