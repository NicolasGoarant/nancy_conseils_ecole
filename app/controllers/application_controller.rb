class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?
  
  private
  
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
  
  def logged_in?
    !!current_user
  end
  
  def require_login
    unless logged_in?
      flash[:alert] = "Veuillez vous connecter pour accéder à cette page."
      redirect_to login_path
    end
  end
  
  def require_admin
    unless current_user&.admin?
      flash[:alert] = "Accès non autorisé."
      redirect_to root_path
    end
  end
  
  def require_official
    unless current_user&.official?
      flash[:alert] = "Accès non autorisé."
      redirect_to root_path
    end
  end
  
  def require_school
    unless current_user&.school?
      flash[:alert] = "Accès non autorisé."
      redirect_to root_path
    end
  end
end