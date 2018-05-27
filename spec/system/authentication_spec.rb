require 'rails_helper'

RSpec.describe 'Authentication', type: :system do

  let(:user) { User.create!(name: 'test_user001', email: 'example@example.com', password: 'password') }
  it 'ユーザー登録' do
    visit new_user_path
    fill_in 'user[name]', with: 'test_user001'
    fill_in 'user[email]', with: 'example@example.com'
    fill_in 'user[password]', with: 'password'
    click_on 'ユーザー登録'
    expect(page).to have_content 'ログインしました'
  end

  context 'ログイン' do
    before { user }

    it 'ユーザー名ログイン' do
      visit login_path
      fill_in 'name_or_email', with: 'test_user001'
      fill_in 'password', with: 'password'
      click_on 'ログイン'
      expect(page).to have_content 'ログインしました'
    end

    it 'メールアドレスログイン' do
      visit login_path
      fill_in 'name_or_email', with: 'example@example.com'
      fill_in 'password', with: 'password'
      click_on 'ログイン'
      expect(page).to have_content 'ログインしました'
    end
  end
end
