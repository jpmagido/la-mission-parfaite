class SeedPasswords < ActiveRecord::Migration[6.1]
  def change
    Password.destroy_all
    Password.create!(content: 'jesuisroro', auth_level: :admin)
    Password.create!(content: 'reblochonetfoiegras', auth_level: :user)
  end
end
