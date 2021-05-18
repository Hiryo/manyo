FactoryBot.define do
  # 作成するテストデータの名前を「task」とします
  # （実際に存在するクラス名と一致するテストデータの名前をつければ、そのクラスのテストデータを自動で作成します）
  factory :user do
    name { 'ruby' }
    email { "test@dic.com" }
    password { "123123" }
    password_confirmation { '123123' }
    admin { "一般" }
  end
  # 作成するテストデータの名前を「second_task」とします
  # （存在しないクラス名の名前をつける場合、オプションで「このクラスのテストデータにしてください」と指定します）
  factory :admin, class: User do
    name { 'hoge' }
    email { "bbb@dic.com" }
    password { "321321" }
    password_confirmation { '321321' }
    admin { "管理者" }
  end
end
