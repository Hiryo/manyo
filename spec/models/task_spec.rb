require 'rails_helper'

  describe 'タスクモデル機能', type: :model do
    describe '検索機能' do
      let!(:task) { FactoryBot.create(:task) }
      let!(:second_task) { FactoryBot.create(:second_task) }
      context 'scopeメソッドでタイトルのあいまい検索をした場合' do
      it '検索キーワードを含むタスクが絞り込まれる' do
        expect(Task.search_name("task")[0].name).to include(task.name)
        # expect(task.search('task')).not_to include(second_task)
        # expect(task.search('task').count).to eq 1
      end
    end
    context 'scopeメソッドでステータス検索をした場合' do
      it "ステータスに完全一致するタスクが絞り込まれる" do
        # expect(task.search('task')).to include(task)
        # expect(task.search_status('task')).to include(second_tasktask)
        # expect(task.search('task').count).to eq 1
      end
    end
    context 'scopeメソッドでタイトルのあいまい検索とステータス検索をした場合' do
      it "検索キーワードをタイトルに含み、かつステータスに完全一致するタスク絞り込まれる" do
        # expect(task.search('task')).to include(task) && (task.search('task')).to include(task)
        # expect(task.search('task').count).to eq 1
      end
    end
  end
end

    describe 'バリデーションのテスト' do
      context 'タスクのタイトルが空の場合' do
        it 'バリデーションにひっかる' do
          task = Task.new(name: '', detail: '失敗テスト')
          expect(task).not_to be_valid
        end
      end
    end
    context 'タスクの詳細が空の場合' do
      it 'バリデーションにひっかかる' do
        task = Task.new(name: '失敗テスト', detail: '')
        expect(task).not_to be_valid
      end
    end
    context 'タスクのタイトルと詳細に内容が記載されている場合' do
      it 'バリデーションが通る' do
        task = Task.new(name: '成功', detail: '成功')
        expect(task).to be_valid
      end
    end
