class Department < ApplicationRecord
  CAPACITY = *(50..550)
  belongs_to :school
  has_many :courses
  has_many :teachers
  scope :sorted, lambda { order('position ASC') }
  validates :school_id, presence: true
  validates :name, presence: true, uniqueness: true
  validates :position, presence:  true, length: { minimum: 1 }, numericality: true
  validates :head_name, presence: true, uniqueness: true
  validates :capacity,
            presence: true,
            numericality: true,
            inclusion: { in: 50..550, message: I18n.t('departments.all.dept_capacity_message')}
end
