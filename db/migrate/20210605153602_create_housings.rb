class CreateHousings < ActiveRecord::Migration[6.1]
  def change
    create_table :housings do |t|
      t.boolean :breakfast, null: false
      t.text :url, null: false
      t.integer :housing_type, null: false

      t.belongs_to :city, null: false, foreign_key: true
      t.belongs_to :location, null: false, foreign_key: true

      t.timestamps
    end
  end
end
