class SchoolsController < ApplicationController
    before_action :require_login
    
    def index
      if current_user.admin?
        @schools = School.all
      elsif current_user.official?
        @schools = School.joins(:associations)
                         .where(associations: { user_id: current_user.id, active: true })
                         .distinct
      else
        @schools = School.joins(:associations)
                         .where(associations: { user_id: current_user.id })
                         .distinct
      end
    end
    
    def show
      @school = School.find(params[:id])
      
      # Vérifier que l'utilisateur a accès à cette école
      unless current_user.admin? || current_user.associations.where(school_id: @school.id).exists?
        flash[:alert] = "Vous n'avez pas accès à cette école."
        redirect_to schools_path
      end
      
      @councils = @school.councils.order(date: :desc)
      @information = @school.information.order(created_at: :desc)
    end
  end