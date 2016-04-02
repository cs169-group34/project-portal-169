class AddStudentTeamRefToProject < ActiveRecord::Migration
  def change
    add_reference :projects, :student_team, index: true, foreign_key: true
  end
end
