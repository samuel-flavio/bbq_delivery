class ProdutoPolicy < ApplicationPolicy
  def new?
    user.admin?
  end
  
  def index?
    user.admin?
  end
  
  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
