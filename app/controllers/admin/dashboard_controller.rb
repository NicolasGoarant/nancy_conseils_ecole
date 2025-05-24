module Admin
  class DashboardController < ApplicationController
    before_action :require_admin
    
    def index
      @users_count = User.count
      @schools_count = School.count
      @councils_count = Council.count
      @reports_count = Report.count
      
      @recent_users = User.order(created_at: :desc).limit(5)
      @recent_councils = Council.order(created_at: :desc).limit(5)
      
      # Récupérer toutes les écoles pour l'affichage
      @schools_to_display = School.all.order(:name)
      @all_schools = School.all.order(:name)
      @upcoming_councils = Council.where('date >= ?', Date.current).order(:date).limit(10)
    end
  end
end