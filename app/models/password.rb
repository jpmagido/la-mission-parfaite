require 'bcrypt'

class Password < ApplicationRecord
  extend Enumerize
  enumerize :auth_level, in: [:user, :admin]
  validates :auth_level, presence: true
  validate :force_uniqueness!, :one_only_user_password, :only_one_admin_password

  before_save :encrypt!

  scope :user_password, -> { find_by(auth_level: :user) }
  scope :admin_password, -> { find_by(auth_level: :admin) }

  private

  def one_only_user_password
    if Rails.env == 'production'
      if Password.user_password.count >= 1 && auth_level == :user
        raise ActiveRecord::RecordInvalid
      end
    end
  end

  def only_one_admin_password
    if Rails.env == 'production'
      if Password.admin_password.count >= 1 && auth_level == :admin
        raise ActiveRecord::RecordInvalid
      end
    end
  end

  def force_uniqueness!
    raise ActiveRecord::RecordNotUnique if duplicated?
  end

  def encrypt!
    self.content = BCrypt::Password.create(content)
  end

  protected

  def decrypt!
    BCrypt::Password.new(self.content)
  end

  def duplicated?
    encrypted_pwds = Password.all.pluck(:content)
    encrypted_pwds.map do |encrypted_pwd|
      BCrypt::Password.new(encrypted_pwd)
    end.include?(content)
  end
end
