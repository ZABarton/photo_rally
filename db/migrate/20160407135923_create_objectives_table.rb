class CreateObjectivesTable < ActiveRecord::Migration
  def change
    create_table :objectives do |t|
      t.string :clue
      t.integer :list_id
      t.timestamps null: false
    end
  end
end
