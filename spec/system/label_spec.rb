require 'rails_helper'
RSpec.describe 'ラベル登録機能', type: :system do
  let!(:user) { FactoryBot.create(:user) }
#   let!(:task) { FactoryBot.create(:task, user: user) }
#   let!(:second_task) { FactoryBot.create(:second_task, user: user) }
#   let!(:label) { FactoryBot.create(:label) }
#   let!(:labeling) { FactoryBot.create(:labeling, task: task, label: label) }

#   def create_labels
#     label1 = FactoryBot.create(:label)
#     label2 = FactoryBot.create(:second_label)
#     label3 = FactoryBot.create(:third_label)
#   end

  before do
    visit new_session_path
    fill_in 'Email', with: 'test@dic.com'
    fill_in 'Password', with: '123123'
    click_button 'commit'
    visit tasks_path
  end

  describe 'ラベル付帯機能' do
    context '新規作成した場合' do
      it 'ラベル、ステータス、優先順位も登録される' do
        FactoryBot.create(:label)
        FactoryBot.create(:second_label)
        FactoryBot.create(:third_label)
        visit new_task_path
        all('input')[0].click
        select '着手中', from: 'task[status]'
        select '中', from: 'task[priority]'
        fill_in 'task[title]', with: 'test'
        fill_in 'task[detail]', with: 'fooo'
        fill_in 'task[expired_at]', with: '2021/5/17'
        click_button 'commit'
        expect(current_path).to have_content "/tasks" #現在いるpageが本当にtasksのindexアクションなのか確認している
        expect(page).to have_content 'label_name1'
        expect(page).to have_content '着手中'
        expect(page).to have_content '中'
      end
    end
  end

    context '検索をした場合' do
      it 'ラベルで検索できる' do
        FactoryBot.create(:label)
        FactoryBot.create(:second_label)
        FactoryBot.create(:third_label)
        # binding.irb
        visit new_task_path
        all('input')[0].click
        select '着手中', from: 'task[status]'
        select '中', from: 'task[priority]'
        fill_in 'task[title]', with: 'test'
        fill_in 'task[detail]', with: 'fooo'
        fill_in 'task[expired_at]', with: '002021/5/17'
        click_button 'commit'
        # binding.irb
        select 'label_name1', from: 'label_id'
        click_button 'commit'
        expect(current_path).to have_content "/tasks" #現在いるpageが本当にtasksのindexアクションなのか確認している
        expect(page).to have_content 'label_name1'
      end
    end
  end

#         click_button 'commit'
#         expect(page).to have_content task.status
#       end
#     end

#     context '検索をした場合' do
#       it 'タイトルとステータスで検索できる' do
#         fill_in "title", with: "hoge"
#         select '完了', from: 'status'
#         click_button 'commit'
#         # binding.pry
#         expect(page).to have_content @task
#       end
#     end
#   end
