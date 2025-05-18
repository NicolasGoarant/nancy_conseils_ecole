class DashboardController < ApplicationController
  before_action :require_login
  
  def index
    # Récupérer toutes les écoles pour la page d'accueil
    @all_schools = School.all
    
    # Récupérer les conseils à venir pour l'utilisateur connecté
    @upcoming_councils = if current_user.admin?
                          Council.where('date >= ?', Date.today).order(date: :asc).limit(5)
                         elsif current_user.official?
                          Council.joins(school: :associations)
                            .where(associations: { user_id: current_user.id, active: true })
                            .where('date >= ?', Date.today)
                            .order(date: :asc)
                            .limit(5)
                         elsif current_user.school?
                          Council.joins(school: :associations)
                            .where(associations: { user_id: current_user.id })
                            .where('date >= ?', Date.today)
                            .order(date: :asc)
                            .limit(5)
                         else
                          []
                         end
    
    # Statistiques générales
    @schools_count = School.count
    @councils_count = Council.count
    @users_count = User.count
    @reports_count = Report.count
  end
end