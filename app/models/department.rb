class Department < ApplicationRecord

  scope :sorted, lambda {order("position ASC")}

  CAPACITY = *(50..550)

  validates :name, :presence => true, :uniqueness => true
  validates :position, :presence => true, :length => {minimum: 1}, :uniqueness => true, :numericality => true
  validates :head_name, :presence => true, :uniqueness => true
  validates :capacity, :presence => true, :inclusion => {:in => 50..550, :message => 'minimum capacity is 50 and maximum capacity is 550' }, :numericality => true

end
