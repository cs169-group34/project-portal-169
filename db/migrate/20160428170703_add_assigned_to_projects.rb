class AddAssignedToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :assigned, :boolean, default: false
  end
end
