class RestaurantPolicy < ApplicationPolicy
  # NOTE: Up to Pundit v2.3.1, the inheritance was declared as
  # `Scope < Scope` rather than `Scope < ApplicationPolicy::Scope`.
  # In most cases the behavior will be identical, but if updating existing
  # code, beware of possible changes to the ancestors:
  # https://gist.github.com/Burgestrand/4b4bc22f31c8a95c425fc0e30d7ef1f5

  # flow -> add a policy action here -> then authorise in the corresponding controller action
  
  def show?
    true
  end

  # new can be omitted because the application policy can be inherited from
  def new?
    create?
  end

  def create?
    true
  end

  # edit can also be omitted
  def edit?
    update?
  end

  # Is the user, the creator of the restaurant? 
  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end

  class Scope < ApplicationPolicy::Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      # scope == Restaurant
      scope.all # same as Restaurant.all

      # scope to user records only
      # scope.where(user: user)

      # scope to non user records
      # scope.where.not(user: user)

      # scope based on role
      # user.admin? ? scope.all : scope.where(user: user)
    end
  end
end
