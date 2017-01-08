class FlightPolicy < ApplicationPolicy
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
    @user.has_role?(:admin)
  end

  def create?
    new?
  end

  def edit?
    @user.has_role?(:admin) ||
    @user.has_role?(:poc) ||
    @resource.created_by?(@user)
  end

  def update?
    edit?
  end

  def destroy?
    @user.has_role?(:admin)
  end
end
