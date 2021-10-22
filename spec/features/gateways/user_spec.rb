# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "/gateways/user.html.erb", type: :feature do
  include_context 'passwords_creation'

  it 'should display content' do
    visit 'gateways/user'
    expect(page).to have_content 'Bienvenue Visiteur'
  end

  context 'user_password' do
    it 'should redirect to static_pages/home' do
      visit 'gateways/user'
      within('.gateway-form') do
        fill_in 'password', with: @correct_user_password
      end
      click_button 'Valider'

      expect(page).to have_content 'HOME PAGE'
    end

    it 'should redirect to gateways/user' do
      visit 'gateways/admin'
      within('.gateway-form') do
        fill_in 'password', with: SecureRandom.hex
      end
      click_button 'Valider'

      expect(page).to have_content 'Bienvenue Visiteur'
    end
  end

  context 'admin password' do
    it 'should redirect to admins/sign_up' do
      visit 'gateways/user'
      within('.gateway-form') do
        fill_in 'password', with: @correct_admin_password
      end
      click_button 'Valider'

      expect(page).to have_content 'Bienvenue Visiteur'
    end
  end
end
