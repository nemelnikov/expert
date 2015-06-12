class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_ability # Two devise models control for cancancan
	  if ask_expert_signed_in?
	    @current_ability ||= Ability.new(current_ask_expert)
	  else
	    @current_ability ||= Ability.new(current_user)
	  end
	end
end
