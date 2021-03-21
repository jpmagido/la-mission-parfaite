require 'rails_helper'

RSpec.describe "/gateways/user.html.erb", type: :feature do
  it 'should display content' do
    visit 'gateways/user'
    expect(page).to have_content 'Bienvenue Visiteur'
  end

  context 'visitor_password' do
    let(:correct_user_password) { ENV['GLOBAL_PASSWORD'] }
    let(:incorrect_user_password) { SecureRandom.hex }

    it 'should redirect to static_pages/home' do
      visit 'gateways/user'
      within('.gateway-form') do
        fill_in 'password', with: correct_user_password
      end
      click_button 'Valider'

      expect(page).to have_content 'HOME PAGE'
    end

    it 'should redirect to gateways/user' do
      visit 'gateways/admin'
      within('.gateway-form') do
        fill_in 'password', with: incorrect_user_password
      end
      click_button 'Valider'

      expect(page).to have_content 'Bienvenue Visiteur'
    end
  end

  context 'admin password' do
    let(:correct_admin_password) { ENV['ADMIN_PASSWORD'] }
    let(:incorrect_admin_password) { SecureRandom.hex }

    it 'should redirect to admins/sign_up' do
      visit 'gateways/user'
      within('.gateway-form') do
        fill_in 'password', with: correct_admin_password
      end
      click_button 'Valider'

      expect(page).to have_content 'Bienvenue Visiteur'
    end
  end
end
