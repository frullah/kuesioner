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
  
  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
