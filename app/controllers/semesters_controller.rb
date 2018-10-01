class SemestersController < ApplicationController
  before_action :find_semester, only: %w[show edit update delete destroy]
  def index
    @semesters = Semester.sorted
  end

  def show ; end

  def new
    @semester = Semester.new
  end

  def create
    @semester = Semester.new(semester_params)
    if @semester.save
      flash[:notice] = t('students.all.std_notice_create')
      redirect_to(semesters_path)
    else
      render :new
    end
  end

  def edit ; end

  def update
    if @semester.update_attributes(semester_params)
      flash[:notice] = t('semesters.all.sem_notice_edit')
      redirect_to(semesters_path(@semester))
    else
      render :edit
    end
  end

  def delete ; end

  def destroy
    @semester.destroy
    flash[:notice] = t('semesters.all.sem_notice_delete')
    redirect_to(semesters_path)
  end

  private
  def semester_params
    params.require(:semester).permit(:sem_ID, :sem_name, :sem_start)
  end
  def find_semester
    @semester = Semester.find(params[:id])
  end
end
