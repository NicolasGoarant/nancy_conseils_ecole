class Admin::SchoolsController < ApplicationController
  before_action :require_admin
  def index
    @schools = School.all.order(:name)
  end
  def show
    @school = School.find(params[:id])
    @upcoming_councils = @school.councils.where('date >= ?', Date.today).order(date: :asc)
    @past_councils = @school.councils.where('date < ?', Date.today).order(date: :desc)
    @information = @school.information.order(created_at: :desc)
  end
  def new
    @school = School.new
  end
  def create
    @school = School.new(school_params)
    if @school.save
      redirect_to admin_school_path(@school), notice: 'École créée avec succès.'
    else
      render :new
    end
  end
  def edit
    @school = School.find(params[:id])
  end
  def update
    @school = School.find(params[:id])
    if @school.update(school_params)
      redirect_to admin_school_path(@school), notice: 'École mise à jour avec succès.'
    else
      render :edit
    end
  end
  def destroy
    @school = School.find(params[:id])
    @school.destroy
    redirect_to admin_schools_path, notice: 'École supprimée avec succès.'
  end
  private
  def school_params
    params.require(:school).permit(:name, :address, :phone, :email, :type, :class_count, :student_count, :teacher_count)
  end
end
