class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def show?
    return true
  end

  # new and create need to have the same boolean value, so we return create instead of a boolean value

  def new?
    return create?
  end

  def create?
    return true
  end

  def edit?
    return update?
  end

  def update?
    return record.user == user
    # only the owner of the flat
    # is the person who made the flat the same as the current user?
    # record - the flat instance
    # user - the current user (like current_user in devise, but in pundit stuff)
    # it returns true if the user owns the flat
    # it returns false if the user does not own the flat
  end

  def destroy?
    return record.user == user
  end
end
