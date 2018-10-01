class Course < ApplicationRecord
  belongs_to :department
  scope :sorted, lambda { order('position ASC') }
  validates :position, presence: true, numericality: true
  validates :course_ID, presence: true, uniqueness: true
  validates :course_name, presence: true, uniqueness: true
  validates :credits,
            presence: true,
            numericality: true,
            inclusion: { in:[1,3], message: I18n.t('courses.all.crs_credit_message') }
end
