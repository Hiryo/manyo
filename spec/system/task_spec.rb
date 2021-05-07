require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :system do
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
end
