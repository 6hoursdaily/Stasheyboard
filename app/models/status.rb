class Status < ActiveRecord::Base
  attr_accessible :name, :message, :service_id, :created_at
  belongs_to :service
  validates :name, :presence => true
  validates :service_id, :presence => true

  scope :recent_statuses, Status.order('created_at ASC').last(4).reverse

end
