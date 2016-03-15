class Course < ActiveRecord::Base
  has_many :check_in_lists
  has_many :user , :through => :check_in_lists
  def self.show_can_check_in_course
    where("start <= ? and end >= ?" , Time.now + 1.hour , Time.now )
  end
end
