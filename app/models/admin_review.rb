class AdminReview < ApplicationRecord
  extend Enumerize
  enumerize :status, in: [:todo, :valid, :error], i18n_scope: ["admin_review.status", "status"]

  validates :email, length: { in: 1..100 }, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :last_name, :first_name, length: { in: 2..100 }
  validates :comment, length: { in: 2..100 }

  belongs_to :reviewable, polymorphic: true
  belongs_to :admin, optional: true
end
