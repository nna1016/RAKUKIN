class AttendancesController < ApplicationController
    def attendanceBook
        @attendaces = Attendance.all
    end
end
