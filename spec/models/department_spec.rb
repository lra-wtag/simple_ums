require 'rails_helper'

RSpec.describe Department, type: :model do

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:head_name) }
  it { is_expected.to validate_presence_of(:position) }
  it { is_expected.to validate_presence_of(:capacity) }

  it 'is invalid with a duplicate department name' do
    create(:department)
    is_expected.to validate_uniqueness_of(:name)
  end

  it 'is invalid with a duplicate head_name of department' do
    create(:department)
    is_expected.to validate_uniqueness_of(:head_name)
  end

  it 'is invalid with a duplicate position of department' do
    create(:department)
    is_expected.to validate_uniqueness_of(:position)
  end

  it { should validate_length_of(:position).is_at_least(1) }
  it { should validate_numericality_of(:position) }
  it { should validate_numericality_of(:capacity) }
  it { is_expected.to validate_inclusion_of(:capacity).in_array(Department::CAPACITY) }

end
