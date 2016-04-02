class AddInstructorCommentsToIterations < ActiveRecord::Migration
  def change
    add_column :iterations, :instructor_comments, :string
  end
end
