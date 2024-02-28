class CreateAttendanceLogs < ActiveRecord::Migration[7.1]
  def change
    create_table :attendance_logs do |t|
      t.string :status
      t.string :dim
      t.integer :total_attend
      t.integer :total_not_attend
      t.references :attendance_session, null: false, foreign_key: true

      t.timestamps
    end
  end
end
