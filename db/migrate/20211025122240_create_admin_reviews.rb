class CreateAdminReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :admin_reviews do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.text :comment
      t.string :status
      t.belongs_to :admin, foreign_key: true, null: true
      t.references :reviewable, polymorphic: true

      t.timestamps
    end
  end
end
