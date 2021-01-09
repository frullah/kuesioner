class JadwalMataKuliahPolicy < AdminCrudPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
