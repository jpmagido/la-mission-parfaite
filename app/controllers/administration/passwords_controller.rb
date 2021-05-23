module Administration
  class PasswordsController < BaseController
    helper_method :password

    def show
    end

    def edit
    end

    def update
      password.update!(params_password)
      redirect_to administration_password_path password
    end

    private

    def password
      @password ||= Password.find(params[:password_id])
    end

    def params_password
      params.require(:password).permit(:content, :auth_level)
    end
  end
end
