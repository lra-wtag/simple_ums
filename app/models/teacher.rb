class Teacher < ApplicationRecord
  belongs_to :department
  scope :sorted, lambda {order('teacher_id ASC')}
  validates :teacher_id, presence: true, uniqueness: true, numericality: true, length: { minimum: 2, maximum: 5 }
  validates :teacher_name, presence: true
  validates :Email, presence: true, uniqueness: true
  validates :Designation, presence: true
end
