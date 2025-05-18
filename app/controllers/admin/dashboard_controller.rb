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
    end
  end
end