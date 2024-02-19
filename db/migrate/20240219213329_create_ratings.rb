class CreateRatings < ActiveRecord::Migration[7.1]
  def change
    create_table :ratings do |t|
      t.integer :rating
      t.string :reviewer_name
      t.string :review_text
      t.references :jelly_cat, null: false, foreign_key: true

      t.timestamps
    end
  end
end
