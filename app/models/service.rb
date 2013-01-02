class Service < ActiveRecord::Base
  attr_accessible :name, :status
  has_many :statuses
  validates :name, :uniqueness => true, :presence => true
  after_create :set_status


  # def downtime_on(date)
  #   statuses = self.
  # end

  def status_at(date)
    weekly_stats = self.statuses.where("DATE(created_at) <= DATE(?) and DATE(created_at) > DATE(?)",
      Time.zone.now, (Time.zone.now - 7.days))
    status = weekly_stats.where("DATE(created_at) = DATE(?)", date).last
    if status.blank?
      status = weekly_stats.where("DATE(created_at) < DATE(?)", date).last
    end
    if status.blank?
      status = s.statuses.where("DATE(created_at) < DATE(?)", date).last
    end
    image_for_status(status.name)
  end 

  private

  def set_status
    Status.create!(name: 'Up', message: 'Hoora!', service_id: self.id)
  end
end
