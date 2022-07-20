class AttendancesController < ApplicationController
    def attendanceBook
        @attendacebook = Attendance.all
    end
    def attendanceEdit
      @attendanceEdit = Attendance.find_by(id: params[:id])
    end
    def attendanceUpdate
      @item = Attendance.find_by(id: params[:id])
      @item.update(in: params[:in],out: params[:out], updater: params[:updater])
      redirect_to attendances_attendanceBook_path
    end
    def attendanceDelete
      Attendance.find_by(id: params[:id]).delete
      redirect_to attendances_attendanceBook_path
    end
    def success
        user = Attendance.order("id DESC").find_by(user_id: params[:user_id])
        staff = User.find_by(id: params[:user_id])
        nowTime = Time.now.to_s(:db)
        if staff.nil?
            flash[:alert] = "無効なスタッフです"
            redirect_to attendances_error_path
        else
          if user.nil? || user.date.to_s != Date.current.strftime("%Y-%m-%d")
            Attendance.create({user_id: params[:user_id], in: nowTime, date: nowTime.slice!(0..9), updater: staff.name})
            redirect_to attendances_success_in_path
          else  
            user.update(out: nowTime, updater: staff.name)
            redirect_to attendances_success_out_path
          end
        end
    end
    
    def error
      youbi = %w[日曜日 月曜日 火曜日 水曜日 木曜日 金曜日 土曜日 日曜日]
      @date = Date.current.strftime("%Y年 %m月 %d日") + "( " +youbi[Date.today.wday] + " )"
    end
    def attendance_params
      params.permit(:user_id)
    end
    def auto
      youbi = %w[日曜日 月曜日 火曜日 水曜日 木曜日 金曜日 土曜日 日曜日]
      @date = Date.current.strftime("%Y年 %m月 %d日") + "( " +youbi[Date.today.wday] + " )"
      @time = Time.now
    end
    def success_in
        youbi = %w[日曜日 月曜日 火曜日 水曜日 木曜日 金曜日 土曜日 日曜日]
        @date = Date.current.strftime("%Y年 %m月 %d日") + "( " +youbi[Date.today.wday] + " )"
    end  
    def success_out
        youbi = %w[日曜日 月曜日 火曜日 水曜日 木曜日 金曜日 土曜日 日曜日]
        @date = Date.current.strftime("%Y年 %m月 %d日") + "( " +youbi[Date.today.wday] + " )"
    end  

end
