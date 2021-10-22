# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "/gateways/admin.html.erb", type: :feature do
  include_context 'with_passwords_creation'

  it 'should display content' do
    visit 'gateways/admin'

    expect(page).to have_content 'Mot de Passe Administrateur'
  end

  context 'user password in gateways/admin' do
    it 'should redirect to gateways/user' do
      visit 'gateways/admin'
      within('.gateway-form') do
        fill_in 'password', with: @correct_user_password
      end
      click_button 'Valider'

      expect(page).to have_content 'HOME PAGE'
    end
  end

  context 'admin password' do
    it 'should redirect to admins/sign_up' do
      visit 'gateways/admin'
      within('.gateway-form') do
        fill_in 'password', with: @correct_admin_password
      end
      click_button 'Valider'

      expect(page).to have_content 'Sign up'
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
end
