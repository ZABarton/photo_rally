class CreateSubmissionsTable < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.integer :objective_id
      t.integer :enrollment_id
      t.string :image
      t.timestamps null: false
    end
  end
end
