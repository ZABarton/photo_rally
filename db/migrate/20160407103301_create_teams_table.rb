class CreateTeamsTable < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.string :mascot
      t.integer :leader_id
      t.timestamps null: false
    end
  add_index :teams, :name, unique: true
  end
end
