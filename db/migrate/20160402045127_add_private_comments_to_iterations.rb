class AddPrivateCommentsToIterations < ActiveRecord::Migration
  def change
    add_column :iterations, :private_comments, :string
  end
end
