class School < ApplicationRecord
  scope :sorted, lambda {order('position ASC')}
  validates :name, presence: true, uniqueness: true
  validates :dean_name, presence: true, uniqueness: true
  validates :position, presence: true, length: {minimum: 1}, uniqueness: true, numericality: true, format: { with: /\A[+-]?\d+\z/ }
end
