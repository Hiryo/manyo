FactoryBot.define do
    # 作成するテストデータの名前を「task」とします
    # （実際に存在するクラス名と一致するテストデータの名前をつければ、そのクラスのテストデータを自動で作成します）
    factory :task do
      name { 'Factoryで作ったデフォルトのネーム１' }
      detail { 'Factoryで作ったデフォルトのディティール１' }
      expired_at { '2020-03-01' }
    end
    # 作成するテストデータの名前を「second_task」とします
    # （存在しないクラス名の名前をつける場合、オプションで「このクラスのテストデータにしてください」と指定します）
    factory :second_task, class: Task do
      name { 'Factoryで作ったデフォルトのネーム２' }
      detail { 'Factoryで作ったデフォルトのディティール２' }
      expired_at { '2020-04-01' }
    end

    factory :third_task, class: Task do
      name { 'Factoryで作ったデフォルトのネーム3' }
      detail { 'Factoryで作ったデフォルトのディティール3' }
      expired_at { '2020-05-01' }
    end
  end
