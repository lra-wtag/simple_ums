FactoryGirl.define do
  factory :department do
    association :school
    sequence (:name) {|n| "EEE#{n}"}
    sequence (:head_name) {|n| "Mohammed Anwer#{n}"}
    description 'Electrical and Electronic Engineering'
    school_id '2'
    position '1'
    capacity '450'
  end
end
