class AddTrackerLinksToStudentTeam < ActiveRecord::Migration
  
  def change
    change_table :student_teams do |t|
      t.column :github_link, :string
      t.column :heroku_link, :string
      t.column :codeclimate_link, :string
      t.column :pivotal_link, :string
    end
  end
  
end
