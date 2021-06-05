class CreateLocations < ActiveRecord::Migration[6.1]
  def change
    create_table :locations do |t|
      t.text :address, null: false
      t.string :street_number, null: false
      t.string :zip_code, null: false
      t.belongs_to :city, null: false, foreign_key: true

      t.timestamps
    end
  end
end
