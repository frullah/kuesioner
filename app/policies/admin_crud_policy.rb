class AdminCrudPolicy < ApplicationPolicy
  def index?
    user.authenticatable_type == "Admin"
  end

  def show?
    user.authenticatable_type == "Admin"
  end

  def create?
    user.authenticatable_type == "Admin"
  end

  def new?
    user.authenticatable_type == "Admin"
  end

  def update?
    user.authenticatable_type == "Admin"
  end

  def edit?
    user.authenticatable_type == "Admin"
  end

  def destroy?
    user.authenticatable_type == "Admin"
  end
  
  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
