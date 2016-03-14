class CourseController < ApplicationController
  before_action :set_course, :only => [:show, :edit, :update, :destroy]

  def index
    @course = Course.all;
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
    # code here
  end

  def update
    # code here
  end

  private

  def set_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:course_name, :group, :start, :end)
  end
end
