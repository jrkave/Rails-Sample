class CreateJellyCats < ActiveRecord::Migration[7.1]
  def change
    create_table :jelly_cats do |t|
      t.string :name
      t.string :description
      t.string :color
      t.string :size
      t.boolean :limited_edition
      t.integer :year

      t.timestamps
    end
  end
end
