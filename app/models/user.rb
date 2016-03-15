class User < ActiveRecord::Base
  # belongs_to :group
  has_many :check_in_lists
  has_many :course, :through => :check_in_lists
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
