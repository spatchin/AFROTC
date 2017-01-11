class EventPolicy < ApplicationPolicy
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
    true
  end

  def create?
    new?
  end

  def edit?
    @user.has_role?(:admin) ||
    @user.has_role?(:poc) ||
    @record.created_by?(@user)
  end

  def update?
    edit?
  end

  def destroy?
    edit?
  end
end
