class CourseEnrollmentsController < ApplicationController
  before_action :find_student
  before_action :find_course
  before_action :find_course_enroll, only: %i[show new edit]
  def index
    @course_enrollments = @course.course_enrollments.sorted
  end

  def show ; end

  private
  def find_course_enroll
    @course_enrollment = CourseEnrollment.find(params[:id])
  end
  def find_student
    if params[:student_id]
    @student = Student.find(params[:student_id])
    end
  end
  def find_course
    if params[:course_id]
    @course = Course.find(params[:course_id])
    end
  end
end
