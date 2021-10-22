# frozen_string_literal: true

require 'bcrypt'

class Password < ApplicationRecord
  extend Enumerize
  enumerize :auth_level, in: [:user, :admin]
  validates :auth_level, presence: true
  validate :force_uniqueness!

  before_save :encrypt!

  scope :user_password, -> { find_by(auth_level: :user) }
  scope :admin_password, -> { find_by(auth_level: :admin) }

  def is_equal_to?(password)
    BCrypt::Password.new(self.content) == password
  end

  private

  def force_uniqueness!
    raise ActiveRecord::RecordNotUnique if duplicated?
  end

  def encrypt!
    self.content = BCrypt::Password.create(content)
  end

  protected

  def duplicated?
    encrypted_pwds = Password.all.pluck(:content)
    encrypted_pwds.map do |encrypted_pwd|
      BCrypt::Password.new(encrypted_pwd)
    end.include?(content)
  end
end
