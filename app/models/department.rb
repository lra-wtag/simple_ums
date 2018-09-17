class Department < ApplicationRecord

  scope :sorted, lambda {order("position ASC")}

  validates :name, :presence => true, :uniqueness => true
  validates :position, :presence => true, :length => {minimum: 1}, :uniqueness => true, :numericality => true, :format => { :with => /\A[+-]?\d+\z/ }
  validates :head_name, :presence => true, :uniqueness => true
  validates :capacity, :presence => true

end
