class SchoolsController < ApplicationController
  before_action :set_school, only: [:show, :edit, :update, :delete, :destroy]
  def index
    @schools = School.sorted
  end

  def show; end

  def new
    @school = School.new
  end

  def create
    @school = School.new(school_params)
    if @school.save
      flash[:notice] = t('schools.all.sch_notice_create')
      redirect_to(schools_path)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @school.update_attributes(school_params)
      flash[:notice] = t('schools.all.sch_notice_edit')
      redirect_to(schools_path(@school))
    else
      render :edit
    end
  end

  def delete; end

  def destroy
    @school.destroy
    flash[:notice] = t('schools.all.sch_notice_delete')
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
