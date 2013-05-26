class Ability
  include CanCan::Ability

  def initialize(current_user)
    if current_user.role == "admin"
      can :manage, :all
    else
      can :create, School
      cannot :index, Problem
    end
  end
end
