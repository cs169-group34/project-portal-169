class IterationsBelongsToStudentTeams < ActiveRecord::Migration
  def change
    change_table :iterations do |t|
      t.belongs_to :student_team, index: true
    end
  end
end
