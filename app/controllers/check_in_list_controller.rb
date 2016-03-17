class CheckInListController < ApplicationController
  before_action :authenticate_user!

  def index
  end
  def check_in
    # 查出該課程的資料
    # 確認該課程是否重複點名
    check_in_exist = current_user.course.where('course_id = ?',course_params[:id])
    # flash[:notice] = check_in_exist.method
    if check_in_exist.size == 1
      flash[:notice] = '已經Check In過摟～'
    else
      flash[:notice] ='Check In Success'
      # CheckInList.create(:user => current_user , :course => course)
      CheckInList.create(:user => current_user , :course_id => course_params[:id])
    end
    redirect_to course_index_path
  end

  private

  def course_params
    params.require(:course).permit(:id)
  end
end
