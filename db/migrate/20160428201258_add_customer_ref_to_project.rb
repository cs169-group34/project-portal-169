class AddCustomerRefToProject < ActiveRecord::Migration
  def change
    add_reference :projects, :customer, index: true, foreign_key: true
  end
end
