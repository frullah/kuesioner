class KuesionerControllerPolicy < ApplicationPolicy
  def isi?
    user.authenticatable_type == "Mahasiswa"
  end
  
  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
