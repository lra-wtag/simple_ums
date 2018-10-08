class CoursesController < ApplicationController
  before_action :set_department_id
  before_action :find_course, only: %i[show edit update delete destroy]
  def index
    @courses = @department.courses.sorted
  end

  def show; end

  def new
    @course = Course.new(department_id: @department.id)
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      flash[:notice] = t('courses.all.crs_notice_create')
      redirect_to(courses_path( department_id: @department.id ))
    else
      render :new
    end
  end

  def edit; end

  def update
    if @course.update_attributes(course_params)
      flash[:notice] = t('courses.all.crs_notice_edit')
      redirect_to(courses_path(@course, department_id: @department.id ))
    else
      render :edit
    end
  end

  def delete; end

  def destroy
    @course.destroy
    flash[:notice] = t('courses.all.crs_notice_delete')
    redirect_to(courses_path(department_id: @department.id))
  end

  private
  def course_params
    params.require(:course).permit(:course_ID,
                                   :course_name,
                                   :position,
                                   :credits,
                                   :department_id)
  end
  def find_course
    @course = Course.find(params[:id])
  end
  def set_department_id
    if params[:department_id]
      @department = Department.find(params[:department_id])
    end
  end
end
