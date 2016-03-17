class CreateIterations < ActiveRecord::Migration
  def change
    create_table :iterations do |t|
      t.integer :iteration
      t.text :user_stories
      t.text :comments
      
      t.timestamps null: false
    end
  end
end
