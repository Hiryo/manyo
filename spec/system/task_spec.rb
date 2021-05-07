require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :system do
<<<<<<< HEAD
  let!(:task) { FactoryBot.create(:task, detail: 'task') }
  before do
    visit tasks_path
  end

    describe '一覧表示機能' do
      context '一覧画面に遷移した場合' do
        it '作成済みのタスク一覧が表示される' do
          task = FactoryBot.create(:task, name: 'task')
          visit tasks_path
          expect(page).to have_content 'task'
      end　
    end
      context 'タスクが作成日時の降順に並んでいる場合'　do
        it '新しいタスクが一番上に表示される' do
          task_list = all('.task_row')
          expect(task_list[0]).to have_content ''
          expect(task_list[1]).to have_content ''
    end
  end
=======
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
>>>>>>> 277891f78570df6c27c792c2c86aac18a4a53f27
end
