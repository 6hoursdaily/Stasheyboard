class Service < ActiveRecord::Base
  attr_accessible :name, :status
  has_many :statuses
  validates :name, :uniqueness => true, :presence => true
end
