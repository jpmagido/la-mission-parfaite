class AdminReview < ApplicationRecord
  enum status: { undefined: 0, todo: 1, accepted: 2, error: 3 } 

  validates :email, length: { in: 1..100 }, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :last_name, :first_name, length: { in: 2..100 }
  validates :comment, length: { in: 2..1000 }

  belongs_to :reviewable, polymorphic: true
  belongs_to :admin, optional: true

  def status_french
    I18n.t("activerecord.attributes.admin_review.status.#{self.status}")
  end

  def self.search_and_paginate(params, per_page: 48)
    ::Search::AdminReview.filter_search(self, params).paginate(page: params[:page].to_i, per_page: per_page)
  rescue StandardError
    ::Search::AdminReview.filter_search(self, params).paginate(page: 1, per_page: per_page)
  end

  def self.status_human
    Hash[AdminReview.statuses.map { |k,v| [I18n.t("activerecord.attributes.admin_review.status.#{k}"), v] }]
  end
end
