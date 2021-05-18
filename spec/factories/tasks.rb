FactoryBot.define do
    # 作成するテストデータの名前を「task」とします
    # （実際に存在するクラス名と一致するテストデータの名前をつければ、そのクラスのテストデータを自動で作成します）
    factory :task do
      title { 'task' }
      detail { 'aaa' }
      expired_at { "2021-05-12 15:00:00" }
      status { '着手中' }
      priority { '高' }
      association :user
    end
    # 作成するテストデータの名前を「second_task」とします
    # （存在しないクラス名の名前をつける場合、オプションで「このクラスのテストデータにしてください」と指定します）
    factory :second_task, class: Task do
      title { 'hoge' }
      detail { 'bbb' }
      expired_at { "2021-05-11 15:00:00" }
      status { '完了' }
      priority { '低' }
      association :user
    end
  end
