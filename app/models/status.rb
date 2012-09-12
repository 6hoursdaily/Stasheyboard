class Status < ActiveRecord::Base
  attr_accessible :name, :message, :service_id
  belongs_to :service
end
