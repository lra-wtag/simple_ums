class Student < ApplicationRecord
  PROG = %w[ Undergraduate Graduate ]
  DEPT = [ 'Accounting', 'Economics', 'General Management', 'CSE', 'EEE', 'ETE' ]
  SEM = %w[ SPR18 SUM18 AUT18 ]
  scope :sorted, lambda {order('std_number ASC')}
  has_many :course_enrollments
  has_many :courses, through: :course_enrollments
  accepts_nested_attributes_for :courses
  validates :std_number, presence: true, uniqueness: true, numericality: true, length: { is: 7 }
  validates :std_email, presence: true, uniqueness: true
  validates :std_name, :std_program, :std_dept_name, :std_semester, presence: true
end
