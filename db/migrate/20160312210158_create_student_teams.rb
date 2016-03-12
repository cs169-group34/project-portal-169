class CreateStudentTeams < ActiveRecord::Migration
  def change
    create_table :student_teams do |t|
      t.string :name
      t.string :email
      t.string :password

      t.timestamps null: false
    end
  end
end
