#==============================================================================
# ** CreateIterations
#==============================================================================

class CreateIterations < ActiveRecord::Migration
  
  def change
    create_table :iterations do |t|
      t.integer :iteration
      t.text :user_stories
      t.text :comments
      t.text :instructor_comments
      t.text :instructor_private_comments
      t.integer :instructor_grades
      
      t.timestamps null: false
    end
  end
  
end
