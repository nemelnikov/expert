class Ability 
  include CanCan::Ability
  #Adding ability to questions controller


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

  #Add permissons for guest users

  def user_access(user)
    if user.isAdmin?
        can :manage, :all
    elsif user.isGuest?
        #Must add something here. Whatever quest user can access
    else
      common_user_access(user)        
    end
  end
  #For now , a user cannot view expert profile, because of authenticate method of devise

  def common_user_access(user)
    profileUserID  = (ProfileUser.find_by_user_id(user.id)).id        
    can :read, :all
    can :userQuestions, ProfileUser, id: profileUserID   
    can :update, ProfileUser, id: profileUserID #Make sure only the user that created the profile can edit it
    can :create, Question
    can :update, Question, profile_user_id: profileUserID  #Only the user that created the question will be able to update it
    
    #can :create, Message, :question => { profile_user_id: profileUserID }
    #The above rule can make sure if the user can write a message.
  end

  def expert_access(expert)
    profileExpertID = (ProfileExpert.find_by_ask_expert_id(expert.id)).id
    can :read, :all
    can :expertQuestions, ProfileExpert, id: profileExpertID
    can :update, ProfileExpert, id: profileExpertID#Make sure only that the expert that created the profile can edit it
    can [:update,:create], Genre
    #can :create, Message, :question => { profile_expert_id: profileExpertID }
    #only the appropriate expert can answer the question.
  end

  def common_rules(user_and_expert)#Set of common rules for all users.
    can :find_experts_by_genre, Genre
  end

end
