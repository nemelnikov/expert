class Ability 
  include CanCan::Ability

  #Expect this class to heavily change as we progress through the course
  def initialize(user_or_expert)
    user_or_expert ||= User.new #Guest user, a user that has not logged in to any model

    common_rules(user_or_expert)

    if user_or_expert.kind_of? User #Check what kind of user we have got, a user or expert
        user_access(user_or_expert)
    else
        expert_access(user_or_expert)
    end
  end

  def user_access(user)
    if user.isAdmin?
        can :manage, :all
    else
        can :read, :all
    end
  end

  def expert_access(expert)
    can :read, :all
    can [:update,:create], Genre
  end

  def common_rules(user_and_expert)#Set of common rules for all users.
    can :find_experts_by_genre, Genre
  end
end
