FactoryBot.define do
  factory :label do
    name { 'label_name1' }
    # association :task
  end
  factory :second_label, class: Label do
    name { 'label_name2' }
    # association :task
  end
  factory :third_label, class: Label do
    name { 'label_name3' }
    # association :task
  end
end