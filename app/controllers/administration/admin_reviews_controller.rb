# frozen_string_literal: true

module Administration
  class AdminReviewsController < BaseController
    helper_method :admin_review, :admin_reviews

    def update
      admin_review.update(params_admin_review)
      redirect_to administration_admin_review_path admin_review
    end

    private

    def admin_review
      @admin_review ||= AdminReview.find_by id: params[:id]
    end

    def admin_reviews
      @admin_reviews ||= AdminReview.search_and_paginate(params, per_page: 20).order(updated_at: :desc)
    end

    def params_admin_review
      params.require(:admin_review).permit(:first_name, :last_name, :email, :comment, :status)
    end
  end
end
