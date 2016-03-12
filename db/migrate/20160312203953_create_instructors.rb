class CreateInstructors < ActiveRecord::Migration
  def change
    create_table :instructors do |t|
      t.string :name
      t.text :email
      t.text :password

      t.timestamps null: false
    end
  end
end
