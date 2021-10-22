# frozen_string_literal: true

RSpec.shared_context 'with_passwords_creation' do
  include RSpec::Rails::ControllerExampleGroup

  before do
    @correct_admin_password = 'correct_admin_password'
    @correct_user_password = 'correct_user_password'
    create(:password, content: @correct_admin_password, auth_level: :admin)
    create(:password, content: @correct_user_password, auth_level: :user)
  end

  class Admins::RegistrationsController
    def check_admin_password!; end
    # This overides method in controller
    # TODO: Find a way to set session inside test suite
  end
end
