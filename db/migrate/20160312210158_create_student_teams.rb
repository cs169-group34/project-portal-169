#==============================================================================
# ** CreateStudentTeams
#==============================================================================

class CreateStudentTeams < ActiveRecord::Migration
  
  def change
    create_table :student_teams do |t|
      t.string :name
      t.string :username
      t.string :password
      t.string :github_link
      t.string :heroku_link
      t.string :codeclimate_link
      t.string :pivotal_link
      
      t.timestamps null: false
    end
  end
  
end
