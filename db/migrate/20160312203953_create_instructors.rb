#==============================================================================
# ** CreateInstructors
#==============================================================================

class CreateInstructors < ActiveRecord::Migration
  
  def change
    create_table :instructors do |t|
      t.string :name
      t.string :email
      t.string :username
      t.string :password

      t.timestamps null: false
    end
  end
end
