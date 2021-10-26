module Administration
  class AdminReviewsController < BaseController
    helper_method :admin_review, :admin_reviews

    private

    def admin_reviews
      @admin_reviews ||= AdminReview.all
    end
    
    def admin_review
      @admin_review ||= AdminReview.find_by id: params[:id]
    end
  end
end
