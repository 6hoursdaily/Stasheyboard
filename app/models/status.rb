class Status < ActiveRecord::Base
  attr_accessible :name, :message, :service_id, :created_at
  belongs_to :service
end
