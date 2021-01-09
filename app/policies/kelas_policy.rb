class KelasPolicy < AdminCrudPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
