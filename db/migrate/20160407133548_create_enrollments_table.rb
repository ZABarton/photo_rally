class CreateEnrollmentsTable < ActiveRecord::Migration
  def change
    create_table :enrollments do |t|
      t.integer :team_id
      t.integer :event_id
      t.timestamps null: false
    end
  end
end
