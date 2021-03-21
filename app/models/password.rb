require 'bcrypt'

class Password < ApplicationRecord
  extend Enumerize
  enumerize :auth_level, in: [:visitor, :admin]

  validate :unique?

  before_save :encrypt!

  private

  def unique?
    if decrypted_passwords.include?(content)
      errors.add(:content, 'Ce password est déjà utilisé')
    end
  end

  def encrypt!
    self.content = BCrypt::Password.create(content)
  end

  protected

  def decrypted_passwords
    passwords = Password.all.pluck(:content)
    passwords.map do |encrypted_pwd|
      BCrypt::Password.new(encrypted_pwd)
    end
  end
end
