require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :system do
  let!(:user) { FactoryBot.create(:user) }
  let!(:task) { FactoryBot.create(:task, user: user) }
  let!(:second_task) { FactoryBot.create(:second_task, user: user) }
  before do
    visit new_session_path
    fill_in 'Email', with: 'test@dic.com'
    fill_in 'Password', with: '123123'
    click_button 'commit'
    visit tasks_path
  end

  describe '新規作成機能' do
    context 'タスクを新規作成した場合' do
      it '作成したタスクが表示される' do
        visit new_task_path
        fill_in 'task[title]', with: 'test'
      end
    end

    context 'タスクを新規作成した場合' do
      it 'ステータスも登録される' do
        visit new_task_path
        select '未着手', from: 'task[status]'
        select '中', from: 'task[priority]'
        fill_in 'task[title]', with: 'test'
        fill_in 'task[detail]', with: 'fooo'
        fill_in 'task[expired_at]', with: '2021/5/17'
        click_button 'commit'
        expect(page).to have_content '未着手'
      end
    end
  end

  describe '一覧表示機能' do
    context '一覧画面に遷移した場合' do
      it '作成済みのタスク一覧が表示される' do
        expect(page).to have_content FactoryBot.build(:task).title
      end
    end

    context 'タスクが作成日時の降順に並んでいる場合' do
      it '新しいタスクが一番上に表示される' do
        task_list = all('.task_row')
        expect(task_list[0]).to have_content user.tasks.first.title
      end
    end

    context '終了期限でソートされた場合' do
      it '終了期限が遅いタスクが一番上に表示される' do
        click_on "終了期限でソートする"
        task_list = all('.task_row')
        tasks = Task.order(expired_at: :DESC)
        expect(task_list[0]).to have_content tasks.first.title
        # expect(task_list[1]).to have_content tasks[1].title
      end
    end

    context '優先順位でソートされた場合' do
      it '優先度の高い順に表示される' do
        click_on "優先度が高い順にソートする"
        task_list = all('.task_row')
        tasks = Task.order(priority: :ASC)
        expect(task_list[0]).to have_content tasks.first.title
        expect(task_list[1]).to have_content tasks[1].title
      end
    end

    context '検索をした場合' do
      it 'タイトルで検索できる' do
        fill_in 'title', with: "task"
        click_button 'commit'
        expect(page).to have_content task.title
      end
    end

    context '検索をした場合' do
      it 'ステータスで検索できる' do
        select '完了', from: 'status'
        click_button 'commit'
        expect(page).to have_content task.status
      end
    end

    context '検索をした場合' do
      it 'タイトルとステータスで検索できる' do
        fill_in "title", with: "hoge"
        select '完了', from: 'status'
        click_button 'commit'
        # binding.pry
        expect(page).to have_content @task
      end
    end
  end

  describe '詳細表示機能' do
    context '任意のタスク詳細画面に遷移した場合' do
      it '該当タスクの内容が表示される' do
        visit task_path(task.id)
        expect(page).to have_content @task
      end
    end
  end
end