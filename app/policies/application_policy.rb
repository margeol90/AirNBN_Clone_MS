# frozen_string_literal: true

class ApplicationPolicy
  attr_reader :user, :record

  # ! user => current_user; record => individual flat, Bookings and reviews?????

  def initialize(user, record)
    @user = user
    @record = record
  end

  # ! true => anyone can do this, false => no one can do this

  def index?
    false
  end

  def show?
    false
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  class Scope
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      raise NotImplementedError, "You must define #resolve in #{self.class}"
    end

    private

    attr_reader :user, :scope
  end
end
