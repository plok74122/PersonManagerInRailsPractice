class CourseController < ApplicationController
  before_action :authenticate_user!
  before_action :set_course, :only => [:show, :edit, :update, :destroy]

  def index
    @course = Course.show_can_check_in_course.includes(:group)
  end

  def create
    @course = Course.new(course_params)
    @course.save()
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

  end

  private

  def set_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:course_name, :group_id, :start, :end)
  end
end
