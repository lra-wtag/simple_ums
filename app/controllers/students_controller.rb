class StudentsController < ApplicationController
  before_action :find_course
  before_action :find_student, only: %i[show edit update delete destroy]
  def index
    @students = Student.sorted
  end

  def show ; end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    @student = @course.students.create(student_params)
    if @student.save
      flash[:notice] = t('students.all.std_notice_create')
      redirect_to(course_enrollments_path(course_id: @course.id))
    else
      render :new
    end
  end

  def edit ; end

  def update
    if @student.update_attributes(student_params)
      flash[:notice] = t('students.all.std_notice_edit')
      redirect_to(students_path(@student))
    else
      render :edit
    end
  end

  def delete ; end

  def destroy
    @student.destroy
    flash[:notice] = t('students.all.std_notice_delete')
    redirect_to(students_path)
  end

  private
  def student_params
    params.require(:student).permit(:std_number,
                                    :std_name,
                                    :std_contact,
                                    :std_email,
                                    :std_address,
                                    :std_program,
                                    :std_dept_name,
                                    :std_semester)
  end
  def find_student
    @student = Student.find(params[:id])
  end
  def find_course
    if params[:course_id]
    @course = Course.find(params[:course_id])
    end
  end
end
