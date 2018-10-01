FactoryGirl.define do
  factory :school do
       sequence (:name) {|n| "School of Law#{n}"}
       sequence (:dean_name) {|n| "Mohammed Anwer#{n}"}
       sequence (:position) {|n| "1#{n}"}
  end
end

