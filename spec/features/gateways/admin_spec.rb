require 'rails_helper'

require 'rails_helper'

RSpec.describe "/gateways/admin.html.erb", type: :feature do
  it 'should display content' do
    visit 'gateways/admin'

    expect(page).to have_content 'Mot de Passe Administrateur'
  end

  context 'user password in gateways/admin' do
    let(:correct_user_password) { ENV['GLOBAL_PASSWORD'] }

    it 'should redirect to gateways/user' do
      visit 'gateways/admin'
      within('.gateway-form') do
        fill_in 'password', with: correct_user_password
      end
      click_button 'Valider'

      expect(page).to have_content 'HOME PAGE'
    end
  end

  context 'admin password' do
    let(:correct_admin_password) { ENV['ADMIN_PASSWORD'] }
    let(:incorrect_admin_password) { SecureRandom.hex }

    it 'should redirect to admins/sign_up' do
      visit 'gateways/admin'
      within('.gateway-form') do
        fill_in 'password', with: correct_admin_password
      end
      click_button 'Valider'

      expect(page).to have_content 'Sign up'
    end

    it 'should redirect to gateways/user' do
      visit 'gateways/admin'
      within('.gateway-form') do
        fill_in 'password', with: incorrect_admin_password
      end
      click_button 'Valider'

      expect(page).to have_content 'Bienvenue Visiteur'
    end
  end
end
