class Course < ActiveRecord::Base
  has_many :check_in_lists
end
