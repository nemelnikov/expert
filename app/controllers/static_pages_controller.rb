class StaticPagesController < ApplicationController
  def home
  end
  
  def topics
  end

  def help
  end

  def userInfo
  	authenticate_user!
  	@user = current_user
  end
end
