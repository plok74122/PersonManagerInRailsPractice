class CourseController < ApplicationController
  before_action :authenticate_user!
  before_action :set_course, :only => [:show, :edit, :update, :destroy,:dashboard]

  def index
    @course = current_user.group.courses.order('start DESC').page(params[:page]).per(10)
  end

  def create
    @course = Course.new(course_params)
    @course.save
    redirect_to :action => :index
  end

  def new
    @course = Course.new
  end

  def show
    # code here
  end

  def edit
    # code here
  end

  def destroy
    @course.destroy
    redirect_to :action => :index
  end

  def update
    # code here
  end

  def dashboard

    @already_check_in_users = Course.first.group.users.where(id: CheckInList.where(course: @course).pluck(:user_id)).includes(:check_in_lists)

    @not_check_in_users = Course.first.group.users.where.not(id: CheckInList.where(course: @course).pluck(:user_id))

    # @all_users_should_check_in_collection = @course.group.users
    # @all_check_in_users_collection = @course.check_in_lists
    #
    # @all_check_in_users_id = Array.new
    # @all_check_in_users_time = Array.new
    # @all_check_in_users_collection.each do |all_check_in_users|
    #   @all_check_in_users_id.push(all_check_in_users.user_id)
    #   @all_check_in_users_time.push(all_check_in_users.created_at)
    # end
    # @all_check_in_users_id_hash = Hash[@all_check_in_users_id.map.with_index.to_a]
    #
    # @all_users_should_check_in = Array.new
    # @all_users_should_check_in_collection.each do |all_users_should_check_in|
    #   @all_users_should_check_in.push(all_users_should_check_in)
    # end
  end

  def check_in_course
    @course = current_user.group.courses.show_can_check_in_course.order('start DESC').includes(:group , :check_in_lists).page(params[:page]).per(10)
  end

  private

  def set_course
    @course = Course.find(params[:course_id])
  end

  def course_params
    params.require(:course).permit(:course_name, :group_id, :start, :end)
  end
end
