class Service < ActiveRecord::Base
  attr_accessible :name, :status
  has_many :statuses
  validates :name, :uniqueness => true, :presence => true
  after_create :set_status

  private

  def set_status
    Status.create!(name: 'Up', message: 'Hoora!', service_id: self.id)
  end
end
