class StaticPagesController < ApplicationController
  before_action :authenticate_user!, only: [:userInfo]

  def home
  end
  
  def topics
  end

  def help
  end

  def userInfo
  	@user = current_user.profile_user
  end
end
