class UserPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      # scope == User
      scope.where(displaced: !user.displaced)
    end

    # def dashboard
    # ends
    def show
      record.displaced != user.displaced
    end
  end
end
