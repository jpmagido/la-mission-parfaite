module Administration
  class AdminMessagesController < BaseController
    def index
      @admin_reviews ||= AdminReview.all
    end
    
    def show
      @admin_review ||= AdminReview.find_by id: params[:id]
    end
  end
end