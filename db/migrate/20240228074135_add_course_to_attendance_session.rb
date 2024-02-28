class AddCourseToAttendanceSession < ActiveRecord::Migration[7.1]
  def change
    add_column :attendance_sessions, :course, :integer
  end
end
