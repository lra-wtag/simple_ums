class Semester < ApplicationRecord
  belongs_to :department
  belongs_to :student
  scope :sorted, lambda {order('sem_start ASC')}
  validates :sem_ID,:sem_name, presence: true
end
