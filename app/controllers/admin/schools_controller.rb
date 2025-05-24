class SchoolsController < ApplicationController
  before_action :require_login
  
  def index
    @schools = School.all.order(:name)
  end
  
  def show
    @school = School.find(params[:id])
    @upcoming_councils = @school.councils.where('date >= ?', Date.today).order(date: :asc)
    @past_councils = @school.councils.where('date < ?', Date.today).order(date: :desc)
    @information = @school.information.order(created_at: :desc)
  end
end
