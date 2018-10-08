class TeachersController < ApplicationController
  before_action :set_department_id
  before_action :find_teacher, only: %i[show edit update delete destroy]
  def index
    @teachers = @department.teachers.sorted
  end

  def show ; end

  def new
    @teacher = Teacher.new(department_id: @department.id)
  end

  def create
    @teacher = Teacher.new(teacher_params)
    if @teacher.save
      flash[:notice] = t('teachers.all.tch_notice_create')
      redirect_to(teachers_path( department_id: @department.id ))
    else
      render :new
    end
  end

  def edit ; end

  def update
    if @teacher.update_attributes(teacher_params)
      flash[:notice] = t('teachers.all.tch_notice_edit')
      redirect_to(teachers_path(@teacher, department_id: @department.id ))
    else
      render :edit
    end
  end

  def delete ; end

  def destroy
    @teacher.destroy
    flash[:notice] = t('teachers.all.tch_notice_delete')
    redirect_to(teachers_path(department_id: @department.id))
  end

  private
  def teacher_params
    params.require(:teacher).permit(:teacher_id, :teacher_name, :Contact, :Email, :Designation, :department_id)
  end
  def find_teacher
    @teacher = Teacher.find(params[:id])
  end
  def set_department_id
    if params[:department_id]
      @department = Department.find(params[:department_id])
    end
  end
end
