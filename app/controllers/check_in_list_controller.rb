class CheckInListController < ApplicationController
  before_action :authenticate_user!

  def index
    @check_in_list = Course.all
  end
  def check_in
    CheckInList.create(:user => current_user , :course_id => course_params[:id])
  end

  private

  def course_params
    params.require(:course).permit(:id)
  end
end
