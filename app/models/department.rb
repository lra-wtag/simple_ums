class Department < ApplicationRecord
  belongs_to :school
  scope :sorted, lambda {order('position ASC')}
  validates :name, presence: true, uniqueness: true
  validates :position, presence:  true, length: {minimum: 1}, numericality: true
  validates :head_name, presence: true, uniqueness: true
  validates :capacity, presence: true
end
