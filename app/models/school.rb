class School < ApplicationRecord

  scope :sorted, lambda {order("position ASC")}

  validates :name, :presence => true, :uniqueness => true, :format => { :with => /\A[a-zA-Z]|(?: [a-zA-Z]+)?\z/}
  validates :dean_name, :presence => true, :uniqueness => true, :format => { :with => /[A-z][\s\.]|[A-z]/ }
  validates :position, :presence => true, :length => {:maximum => 3}, :uniqueness => true, :numericality => true, :format => { :with => /\A[+-]?\d+\z/ }

end
