class Student < ApplicationRecord
  #has_many :semesters
  scope :sorted, lambda {order('std_number ASC')}
  validates :std_number, presence: true, uniqueness: true, numericality: true, length: { is: 7 }
  validates :std_email, presence: true, uniqueness: true
  validates :std_name, :std_program, :std_dept_name, :std_semester, presence: true
end
