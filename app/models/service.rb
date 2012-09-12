class Service < ActiveRecord::Base
  attr_accessible :name
  attr_accessible :name, :status
  has_many :statuses
end
