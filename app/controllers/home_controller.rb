class HomeController < ApplicationController
  def index
    user = Attendance.order("id DESC").find_by(user_id: current_user.id)
    if  user.nil?
    elsif user.date.to_s == Date.current.strftime("%Y-%m-%d")
        @attendanceMy = user
    end
    @date = Date.current.strftime("%Y年 %m月 %d日")
    @time = Time.now
  end
  def staffMaster
    if  current_user.department == "本部"
    @staffs = User.all
    else
      redirect_to root_path
    end
  end
end
