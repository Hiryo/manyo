FactoryBot.define do

  factory :task do
    name { 'Factoryで作ったデフォルトの名前１'}
    detail { 'Factoryで作ったデフォルトの詳細１'}
  end

  factory :second_task, class: Task do
    name { 'Factoryで作ったデフォルトの名前2'}
    detail { 'Factoryで作ったデフォルトの詳細2'}
  end
end