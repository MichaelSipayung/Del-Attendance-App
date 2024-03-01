class AttendanceSessionsController < ApplicationController
  def new
    @attendance_session = AttendanceSession.new
  end

  def create
    @attendance_session = AttendanceSession.new(attendance_session_params)
    if @attendance_session.save
      flash[:success] = "Attendance session created!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @attendance_session = AttendanceSession.find(params[:id])
  end

  def update
    @attendance_session = AttendanceSession.find(params[:id])
    if @attendance_session.update(attendance_session_params)
      flash[:success] = "Attendance session updated!"
      redirect_to root_path
    else
      render 'edit'
    end
  end

  private
  def attendance_session_params
    params.require(:attendance_session).permit(:name, :summary, :begin, :end, :room, :course)
  end
end
