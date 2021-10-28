# frozen_string_literal: true

# Administration::PasswordsController
module Administration
  class PasswordsController < BaseController
    helper_method :password, :passwords

    def update
      password.update!(params_password)
      redirect_to administration_password_path password
    end

    private

    def password
      @password ||= passwords.find(params[:id])
    end

    def passwords
      @passwords ||= Password.all
    end

    def params_password
      params.require(:password).permit(:content, :auth_level)
    end
  end
end
