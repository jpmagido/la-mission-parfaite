class CreateAdminReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :admin_reviews do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email
      t.text :comment
      t.integer :status, default: 0
      t.belongs_to :admin, foreign_key: true, null: true
      t.references :reviewable, polymorphic: true

      t.timestamps
    end
  end
end
