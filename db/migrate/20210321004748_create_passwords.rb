class CreatePasswords < ActiveRecord::Migration[6.1]
  def change
    create_table :passwords do |t|
      t.string :content
      t.string :auth_level

      t.timestamps
    end
  end
end
