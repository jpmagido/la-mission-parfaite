require 'rails_helper'

RSpec.describe "/devise/session/new.html.erb", type: :feature do
  include_context 'passwords_creation'

  let!(:admin) { create(:admin, password: 'blablabla') }

  context 'Sign IN Devise Admin' do
    it 'should redirect to admin dashboard' do
      visit new_admin_session_path
      within('.gateway-container') do
        fill_in 'admin_email', with: admin.email
        fill_in 'admin_password', with: 'blablabla'
      end
      click_button 'Log in'

      expect(page).to have_content 'dashboard ADMIN'
    end
  end
end
