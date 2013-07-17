class Ability
  include CanCan::Ability

  def initialize(current_user)
    if current_user.role == "admin"
      can :manage, :all
    else 
      can :manage, AppList, :user_id => current_user.id
      can :create, School
      cannot :index, Problem
      
      #social feature
      can :manage, Group, :groupmembers => { :user_id => current_user.id, :admin => true, :owner => true }
    end 
  end
  
  
  
end
