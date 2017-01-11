class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def index?
    true
  end

  def show?
    true
  end

  def new?
    @user.has_role?(:admin) ||
    @user.has_role?(:poc)
  end

  def create?
    new?
  end

  def edit?
    @user.has_role?(:admin) ||
    @user.has_role?(:cc, @record.try(:flight))
  end

  def update?
    edit?
  end

  def destroy?
    edit?
  end
end
