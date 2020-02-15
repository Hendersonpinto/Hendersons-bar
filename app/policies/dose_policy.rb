class DosePolicy < ApplicationPolicy
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

  def owner_or_admin?
    record.cocktail.owner == user
  end
end
