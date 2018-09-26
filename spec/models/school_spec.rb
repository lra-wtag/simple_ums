require 'rails_helper'
describe School, type: :model do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:dean_name) }
    it { is_expected.to validate_presence_of(:position) }
    it 'is invalid with a duplicate name' do
      create(:school)
      is_expected.to validate_uniqueness_of(:name)
    end
    it 'is invalid with a duplicate dean_name' do
      create(:school)
      is_expected.to validate_uniqueness_of(:dean_name)
    end
    it 'is invalid with a duplicate position' do
      create(:school)
      is_expected.to validate_uniqueness_of(:position)
    end
    it { should validate_length_of(:position).is_at_least(1) }
    it { should validate_numericality_of(:position) }
end
