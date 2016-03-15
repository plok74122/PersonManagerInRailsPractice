class Course < ActiveRecord::Base
  belongs_to :group
  # has_many :users , :through => :groups
  # has_many :group_of_courses, class_name: "User", foreign_key: "group_id"
  has_many :check_in_lists
  has_many :user , :through => :check_in_lists

  def self.show_can_check_in_course
    where("start <= ? and end >= ?" , Time.now + 1.hour , Time.now)
  end
end
