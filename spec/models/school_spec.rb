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


  ####### With factory girl ###################
  # it "is invalid without a name" do
  #   school = build(:school, name: nil)
  #   school.valid?
  #   expect(school.errors[:name]).to include("can't be blank")
  # end
  #
  #  it "is invalid without a dean_name" do
  #    school = build(:school, dean_name: nil)
  #    school.valid?
  #    expect(school.errors[:dean_name]).to include("can't be blank")
  #  end
  #
  #   it "is invalid without a position" do
  #    school = build(:school, position: nil)
  #    school.valid?
  #    expect(school.errors[:position]).to include("can't be blank")
  #  end
  #
  #  it "is invalid with a duplicate name" do
  #   FactoryGirl.create(:school, name:"School of Law")
  #   school = build(:school, name:"School of Law")
  #   school.valid?
  #   expect(school.errors[:name]).to include("has already been taken")
  #  end
  #
  #  it "is invalid with a duplicate dean_name" do
  #    FactoryGirl.create(:school, dean_name:"Mohammed Anwer")
  #   school = build(:school, dean_name:"Mohammed Anwer")
  #   school.valid?
  #   expect(school.errors[:dean_name]).to include("has already been taken")
  #  end
  #
  #  it "is invalid with a duplicate position" do
  #    FactoryGirl.create(:school, position:"1")
  #   school = build(:school, position:"1")
  #   school.valid?
  #   expect(school.errors[:position]).to include("has already been taken")
  #  end



  ####### Without factory girl ###################
  # it "is valid with name dean_name and position" do
  #   school = School.new(
  #       name: 'School of Business',
  #       dean_name: 'Mohammed Anwer',
  #       position: '1'
  #   )
  #   expect(school).to be_valid
  # end
  #
  # it "is invalid without a name" do
  #   school = School.new(name: nil)
  #   school.valid?
  #   expect(school.errors[:name]).to include("can't be blank")
  # end
  #
  # it "is invalid without a dean_name" do
  #   school = School.new(dean_name: nil)
  #   school.valid?
  #   expect(school.errors[:dean_name]).to include("can't be blank")
  # end
  #
  # it "is invalid without a position" do
  #   school = School.new(position: nil)
  #   school.valid?
  #   expect(school.errors[:position]).to include("can't be blank")
  # end
  #
  # it "is invalid with a duplicate name" do
  #   School.create(
  #       name: 'School of Business', dean_name: 'Mohammed Anwer' , position: '1'
  #   )
  #   school = School.new(
  #       name: 'School of Business', dean_name: 'Rifat Reza' , position: '2'
  #   )
  #   school.valid?
  #   expect(school.errors[:name]).to include("has already been taken")
  # end
  #
  # it "is invalid with a duplicate dean_name" do
  #   School.create(
  #       name: 'School of Law', dean_name: 'Rifat Reza' , position: '3'
  #   )
  #   school= School.new(
  #       name: 'School of Business', dean_name: 'Rifat Reza' , position: '2'
  #   )
  #   school.valid?
  #   expect(school.errors[:dean_name]).to include("has already been taken")
  # end
  #
  #
  # it "is invalid with a duplicate position" do
  #   School.create(
  #       name: 'School of Law', dean_name: 'Rifat Reza' , position: '2'
  #   )
  #   school= School.new(
  #       name: 'School of Business', dean_name: 'Henry' , position: '2'
  #   )
  #   school.valid?
  #   expect(school.errors[:position]).to include("has already been taken")
  # end

end