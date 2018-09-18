FactoryGirl.define do

  factory :department do
    sequence (:name) {|n| "EEE#{n}"}
    sequence (:position) {|n| "1#{n}"}
    sequence (:head_name) {|n| "Dr. Mahady Hasan#{n}"}
    description 'Electrical and Electronics Engineering'
    capacity '500'
  end

end
