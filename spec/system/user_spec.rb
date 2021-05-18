require 'rails_helper'

RSpec.feature 'ユーザ登録テスト', type: :system do
  let!(:user) { FactoryBot.create(:user) }
  let!(:admin) { FactoryBot.create(:admin) }

  describe 'ユーザ登録のテスト' do
    context '新規登録した場合' do
      it 'ユーザの新規登録ができる' do
        visit new_user_path
        fill_in 'Name', with: 'ruby'
        fill_in 'Email', with: 'aaa@dic.com'
        fill_in 'Password', with: '123123'
        fill_in 'Password confirmation', with: '123123'
        click_button 'Create account'
        expect(page).to have_content 'rubyのページ'
      end
    end
  # binding.irb

    context 'ログインせずタスク一覧画面に飛ぼうとした場合' do
      it 'ログイン画面に遷移する' do
        visit tasks_path
        expect(page).to have_content 'Email'
        expect(page).to have_content 'Password'
      end
    end

    context 'ログインしようとした場合' do
      it 'ユーザーがログインでき、マイページへ飛べる' do
        visit new_session_path
        fill_in 'session[email]', with: 'bbb@dic.com'
        fill_in 'session[password]', with: '321321'
        click_button 'Login'
        expect(page).to have_content 'hogeのページ'
      end
    end

    context 'ログアウトしようとした場合' do
      it 'ログアウトできる' do
        visit new_session_path
        fill_in 'session[email]', with: 'bbb@dic.com'
        fill_in 'session[password]', with: '321321'
        click_button 'Login'
        click_on 'Logout'
        expect(page).to have_content 'Login'
      end
    end
  end

  describe '管理画面のテスト' do
    context '管理者がアクセスした場合' do
      it '管理画面にアクセスができる' do
        visit new_session_path
        fill_in 'session[email]', with: 'bbb@dic.com'
        fill_in 'session[password]', with: '321321'
        click_button 'Login'
        click_link '一覧に戻る'
        click_link '管理者画面'
        expect(page).to have_content 'ユーザー一覧'
      end
    end
    context 'ユーザーがアクセスした場合' do
      it '管理画面にアクセスができない' do
        # binding.irb
        visit new_user_path
        fill_in 'Name', with: 'ruby'
        fill_in 'Email', with: 'aaa@dic.com'
        fill_in 'Password', with: '123123'
        fill_in 'Password confirmation', with: '123123'
        click_button 'Create account'
        click_on '一覧に戻る'
        click_link '管理者画面'
        expect(page).to have_content '管理者画面です'
      end
  end

    context '管理者がユーザーを新規登録をした場合' do
      it '新規登録ができる' do
        visit new_session_path
        fill_in 'session[email]', with: 'bbb@dic.com'
        fill_in 'session[password]', with: '321321'
        click_button 'Login'
        click_on '一覧に戻る'
        click_on '管理者画面'
        click_link 'create'
        fill_in 'Name', with: 'test'
        fill_in 'Email', with: 'ccc@dic.com'
        fill_in 'Password', with: '123123'
        fill_in 'Password confirmation', with: '123123'
        click_button 'Create account'
        expect(page).to have_content 'id'
        expect(page).to have_content '作成者'
        expect(page).to have_content 'タスク数'
      end
    end

    context '管理者がユーザーの詳細へアクセスをした場合' do
      it '詳細画面へ飛ぶことができる' do
        visit new_session_path
        fill_in 'session[email]', with: 'bbb@dic.com'
        fill_in 'session[password]', with: '321321'
        click_button 'Login'
        click_link '一覧に戻る'
        click_link '管理者画面'
        click_on '詳細', match: :first
        expect(page).to have_content 'id'
        expect(page).to have_content '作成者'
        expect(page).to have_content 'タスク数'
      end
    end

    context '管理者がユーザーの編集画面へアクセスをした場合' do
      it 'ユーザーの編集ができる' do
        visit new_session_path
        fill_in 'session[email]', with: 'bbb@dic.com'
        fill_in 'session[password]', with: '321321'
        click_button 'Login'
        click_on '一覧に戻る'
        click_on '管理者画面'
        click_on '編集', match: :first
        fill_in 'Name', with: 'test'
        fill_in 'Email', with: 'ccc@dic.com'
        fill_in 'Password', with: '123123'
        fill_in 'Password confirmation', with: '123123'
        click_button 'Create account'
        expect(page).to have_content 'id'
        expect(page).to have_content '作成者'
        expect(page).to have_content 'タスク数'
      end
    end

    context '管理者がユーザーを削除した場合' do
      it 'ユーザーの削除ができる' do
        visit new_session_path
        fill_in 'session[email]', with: 'bbb@dic.com'
        fill_in 'session[password]', with: '321321'
        click_button 'Login'
        click_on '一覧に戻る'
        click_on '管理者画面'
        click_on '削除', match: :first
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content 'ユーザー一覧'
      end
    end
  end
end
