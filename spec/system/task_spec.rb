require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :system do
  let!(:task) { FactoryBot.create(:task) }
  let!(:second_task) { FactoryBot.create(:second_task) }
  before do
    visit tasks_path
  end

  describe '新規作成機能' do
    context 'タスクを新規作成した場合' do
      it 'ステータスも登録される' do
				visit new_task_path
        select '未着手', from: 'task[status]'
        expect(page).to have_content '未着手'
      end
    end
  end

  describe '一覧表示機能' do
    context '一覧画面に遷移した場合' do
      it '作成済みのタスク一覧が表示される' do
        task = FactoryBot.create(:task, name: 'task')
        expect(page).to have_content 'task'
      end
    end

  context 'タスクが作成日時の降順に並んでいる場合' do
    it '新しいタスクが一番上に表示される' do
      # binding.irb
      task_list = all('.task_row')
      expect(task_list[0]).to have_content 'task'
    end
  end

  context '終了期限でソートされた場合' do
    it '終了期限が遅いタスクが一番上に表示される' do
      click_on "終了期限でソートする"
      task_list = all('.task_row')
      expect(task_list[0]).to have_content "task"
      expect(task_list[1]).to have_content "hoge"
    end
  end

  context '優先順位でソートされた場合' do
    it '優先度の高い順に表示される' do
      click_on "優先度が高い順にソートする"
      task_list = all('.task_row')
      expect(task_list[0]).to have_content "高"
      expect(task_list[1]).to have_content "低"
    end
  end

  context '検索をした場合' do
    it 'タイトルで検索できる' do
      fill_in "name", with: "hoge"
      expect(page).to have_content 'hoge'
      click_button "search"
    end
  end
  context '検索をした場合' do
    it 'ステータスで検索できる' do
      select '未着手', from: 'status'
      expect(page).to have_content '未着手'
    end
  end
  context '検索をした場合' do
    it 'タイトルとステータスで検索できる' do
      fill_in "name", with: "hoge"
      select '未着手', from: 'status'
      expect(page).to have_content 'hoge'
      expect(page).to have_content '未着手'
      click_button "search"
    end
  end
end

  describe '詳細表示機能' do
     context '任意のタスク詳細画面に遷移した場合' do
       it '該当タスクの内容が表示される' do
				task = FactoryBot.create(:task, name: 'task', detail: 'task')
				visit task_path(task.id)
				expect(page).to have_content 'task'
       end
     end
  end
end
