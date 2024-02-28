class CreateAttendanceSessions < ActiveRecord::Migration[7.1]
  def change
    create_table :attendance_sessions do |t|
      t.string :name
      t.string :summary
      t.string :begin
      t.string :end
      t.string :room
      t.date :date

      t.timestamps
    end
  end
end
