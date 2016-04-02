class AddInstructorRefToStudentTeam < ActiveRecord::Migration
  def change
    add_reference :student_teams, :instructor, index: true, foreign_key: true
  end
end
