class DepartamentoPolicy < ApplicationPolicy
  def index?
    user.admin?
  end

  def show?
    user.admin?
  end
  
  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
