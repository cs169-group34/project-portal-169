class AddProjectRefToStudentTeam < ActiveRecord::Migration
  def change
    add_reference :student_teams, :project, index: true, foreign_key: true
  end
end
