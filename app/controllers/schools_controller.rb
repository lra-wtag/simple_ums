class SchoolsController < ApplicationController

  before_action :set_school, only: [:show, :edit, :update, :destroy]

  def index
    @schools = School.sorted
    render (:index)
  end

  def show
    @school = School.find(params[:id])
  end

  def new
    @school = School.new
  end

  def create
    @school = School.new(school_params)
    if @school.save
      flash[:notice] = "School created successfully!"
      redirect_to(schools_path)
    else
      render(:new)
    end
  end

  def edit
    @school = School.find(params[:id])
  end

  def update
    @school = School.find(params[:id])
    if @school.update_attributes(school_params)
      flash[:notice] = "School updated successfully!"
      redirect_to(schools_path(@school))
    else
      render('edit')
    end
  end

  def delete
    @school = School.find(params[:id])
  end

  def destroy
    @school = School.find(params[:id])
    @school.destroy
    flash[:notice] = "School '#{@school.name}' destroyed successfully!"
    redirect_to(schools_path)
  end

  private
  def school_params
    params.require(:school).permit(:name, :dean_name, :position)
  end

  def set_school
    @school = School.find(params[:id])
  end

end
