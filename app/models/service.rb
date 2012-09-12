class Service < ActiveRecord::Base
<<<<<<< .merge_file_WFkQOo
  attr_accessible :name
=======
  attr_accessible :name, :status
>>>>>>> .merge_file_TPGnMi
  has_many :statuses
end
