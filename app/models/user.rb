class User < ActiveRecord::Base
  belongs_to :group
  has_many :group_of_courses , :through => :group , :source => :courses , class_name: "course"
  # has_many :group_of_courses, class_name: "Course", foreign_key: "group_id"
  has_many :check_in_lists
  has_many :courses, :through => :check_in_lists
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
