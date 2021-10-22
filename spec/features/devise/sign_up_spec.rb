# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "/devise/registration/new.html.erb", type: :feature do
  include_context 'with_passwords_creation'

  context 'Sign UP Devise Admin' do
    it 'should redirect to admin dashboard' do
      visit new_admin_registration_path
      within('.gateway-container') do
        fill_in 'admin_email', with: 'admin@rspec.com'
        fill_in 'admin_password', with: 'jesuisunpassword'
        fill_in 'admin_password_confirmation', with: 'jesuisunpassword'
      end
      click_button 'Sign up'

      expect(page).to have_content 'dashboard ADMIN'
    end
  end
end
