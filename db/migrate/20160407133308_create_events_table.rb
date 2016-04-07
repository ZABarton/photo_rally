class CreateEventsTable < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :event_type
      t.string :name
      t.datetime :event_start
      t.datetime :event_end
      t.integer :list_id
      t.timestamps null: false
    end
  end
end
