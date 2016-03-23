class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.references :category

      t.timestamps
    end
  end
end
