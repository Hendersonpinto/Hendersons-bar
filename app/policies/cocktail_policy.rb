class CocktailPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def create?
    true
  end

  def new?
    create?
  end

  def edit?
    owner_or_admin?
  end

  def update?
    owner_or_admin?
  end  
  
  def destroy?
    owner_or_admin?
  end
  
  def editing?
    owner_or_admin?
  end
  
  def new_instructions?
    owner_or_admin?
  end

  def owner_or_admin?
    record.owner == user
  end
end
