
class SchoolsController < ApplicationController
  before_action :set_school, only: [:show, :edit, :update, :destroy]

  # GET /schools
  # GET /schools.json
  def index
    @schools = School.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @schools }
    end
  end

  # GET /schools/:id
  # GET /schools/:id.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @school }
    end
  end

  # GET /schools/new
  def new
    @school = School.new
  end

  # GET /schools/:id/edit
  def edit
  end

  # POST /schools
  # POST /schools.json
  def create
    @school = School.new(school_params)

    respond_to do |format|
      if @school.save
        format.html { redirect_to @school, notice: 'École créée avec succès.' }
        format.json { render json: @school, status: :created }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @school.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /schools/:id
  # PATCH/PUT /schools/:id.json
  def update
    respond_to do |format|
      if @school.update(school_params)
        format.html { redirect_to @school, notice: 'École mise à jour avec succès.' }
        format.json { render json: @school, status: :ok }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @school.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schools/:id
  # DELETE /schools/:id.json
  def destroy
    @school.destroy

    respond_to do |format|
      format.html { redirect_to schools_url, notice: 'École supprimée avec succès.' }
      format.json { head :no_content }
    end
  end

  private

  # Méthode pour trouver l’école à partir de l’ID
  def set_school
    @school = School.find(params[:id])
  end

  # Paramètres autorisés
  def school_params
    params.require(:school).permit(:name, :address, :city, :zip_code, :phone, :email)
  end
end