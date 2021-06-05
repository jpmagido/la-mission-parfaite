class CreateLocations < ActiveRecord::Migration[6.1]
  def change
    create_table :locations do |t|
      t.text :address
      t.string :street_number
      t.string :zip_code
      t.belongs_to :city, null: false, foreign_key: true

      t.timestamps
    end
  end
end
