class AddInstructorGradesToIterations < ActiveRecord::Migration
  def change
    add_column :iterations, :instructor_grades, :integer
  end
end
