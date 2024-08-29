class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.admin?
      can :manage, :all
    else
      can :read, Product
      can :read, Category
      can :create, CartItem
      can :read, CartItem
    end
  end
end
