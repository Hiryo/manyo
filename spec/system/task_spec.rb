require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :system do
	before do
    FactoryBot.create(:task)
    FactoryBot.create(:second_task)
  end
  describe '新規作成機能' do
    context 'タスクを新規作成した場合' do
      it '作成したタスクが表示される' do
				visit new_task_path
				fill_in 'task[name]', with: 'task'
				click_button '投稿する'
      end
    end
  end

  describe '一覧表示機能' do
    context '一覧画面に遷移した場合' do
      it '作成済みのタスク一覧が表示される' do
        task = FactoryBot.create(:task, name: 'task')
        visit tasks_path
        expect(page).to have_content 'task'
      end
    end
  end
  describe '詳細表示機能' do
     context '任意のタスク詳細画面に遷移した場合' do
       it '該当タスクの内容が表示される' do
				# binding.irb
				task = FactoryBot.create(:task, name: 'task', detail: 'task')
				visit task_path(task.id)
				expect(page).to have_content 'task'
       end
     end
  end
end