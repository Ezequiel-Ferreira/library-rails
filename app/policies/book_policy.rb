class BookPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    user.admin? || record.user == user
  end

  def create?
    user.present?
  end

  def update?
    user.admin? || record.user == user
  end

  def destroy?
    user.admin? || record.user == user
  end

  class Scope < Scope
    def resolve
      user.admin? ? scope.all : scope.where(user: user)
    end
  end
end
