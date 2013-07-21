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
      can :read, Group, :groupmembers => { :user_id => current_user.id }
      
#     can :manage, Groupmember, :user_id => current_user.id, :admin => true, :owner => true, :groups => {:group_id => } 
      
#      can :manage, Document, :user_id => current_user.id
#      can :read, Document, :groupmembers => { :groupmembers => }
      
      #can [:create, :destroy], Comment, :commentable_type => "Group", :groupmembers => { :user_id => current_user.id, :admin => true }
      #can [:create], Comment, :groupmembers => { :user_id => current_user.id }
      #can :manage, Comment, :groupmembers => { :user_id => current_user.id, :admin => true }
      
    end 
  end
  
  
  
end
