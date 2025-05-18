module Admin
  class UsersController < ApplicationController
    before_action :require_admin
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    
    def index
      @users = User.all
    end
    
    def show
    end
    
    def new
      @user = User.new
    end
    
    def create
      @user = User.new(user_params)
      
      if @user.save
        redirect_to admin_users_path, notice: 'Utilisateur créé avec succès.'
      else
        render :new, status: :unprocessable_entity
      end
    end
    
    def edit
    end
    
    def update
      if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
        params[:user].delete(:password)
        params[:user].delete(:password_confirmation)
      end
      
      if @user.update(user_params)
        redirect_to admin_users_path, notice: 'Utilisateur mis à jour avec succès.'
      else
        render :edit, status: :unprocessable_entity
      end
    end
    
    def destroy
      @user.destroy
      redirect_to admin_users_path, notice: 'Utilisateur supprimé avec succès.'
    end
    
    private
    
    def set_user
      @user = User.find(params[:id])
    end
    
    def user_params
      params.require(:user).permit(:username, :password, :password_confirmation, :full_name, :email, :role)
    end
  end
end