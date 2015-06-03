class StaticPagesController < ApplicationController
  before_action :authenticate_user!, only: [:userInfo]

  def home
  end
  
  def topics
  end

  def help
  end

 # def userInfo
  	#redirect_to profile_user_url(ProfileUser.find_by_user_id(current_user.id))
 # end
end
