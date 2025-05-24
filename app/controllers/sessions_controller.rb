class SessionsController < ApplicationController
  def new
    # Récupérer toutes les écoles pour l'affichage en vignettes
    @schools = School.all.order(:name)
    
    # Récupérer les types distincts pour le filtrage
    @school_types = School.distinct.pluck(:type).compact
    
    # Pré-remplir les identifiants admin si demandé
    @use_admin = params[:admin] == 'true'
  end
  
  def create
    # Traitement spécial pour l'administrateur
    if params[:username].downcase == 'admin' && params[:password] == 'password'
      admin = User.find_by(role: 'admin')
      
      if admin
        session[:user_id] = admin.id
        redirect_to admin_root_path, notice: 'Connexion admin réussie!'
        return
      end
    end
    
    # Traitement normal pour les autres utilisateurs
    user = User.find_by(username: params[:username])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      
      # Rediriger vers le tableau de bord approprié selon le rôle
      if user.admin?
        redirect_to admin_root_path, notice: 'Connexion réussie!'
      elsif user.school?
        redirect_to dashboard_path, notice: 'Connexion réussie!'
      elsif user.official?
        redirect_to dashboard_path, notice: 'Connexion réussie!'
      else
        redirect_to dashboard_path, notice: 'Connexion réussie!'
      end
    else
      flash.now[:alert] = 'Identifiants invalides'
      @schools = School.all.order(:name)
      @school_types = School.distinct.pluck(:type).compact
      render :new, status: :unprocessable_entity
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: 'Déconnexion réussie!'
  end
  
  # Ajout d'une méthode pour pré-remplir le nom d'utilisateur selon l'école sélectionnée
  def school_login
    @school = School.find(params[:id])
    redirect_to login_path(school_id: @school.id)
  end
  
  # Mode administrateur - permet un accès direct avec les identifiants admin
  def admin_mode
    redirect_to login_path(admin: true)
  end
end