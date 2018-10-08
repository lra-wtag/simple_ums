class CourseEnrollment < ApplicationRecord
  belongs_to :course
  belongs_to :student
  scope :sorted, lambda { order('course_id ASC') }
end
