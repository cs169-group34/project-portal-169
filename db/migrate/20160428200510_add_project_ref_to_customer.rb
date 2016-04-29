class AddProjectRefToCustomer < ActiveRecord::Migration
  def change
    add_reference :customers, :project, index: true, foreign_key: true
  end
end
