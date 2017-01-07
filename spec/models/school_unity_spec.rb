require 'rails_helper'

RSpec.describe SchoolUnity, type: :model do
  describe 'When create school unity' do
    context 'with valid fields' do
      let(:school_unity) { build :school_unity }
      it 'should be valid' do
        expect(school_unity).to be_valid
      end

      it 'should be saved' do
        expect(school_unity.save).to be_truthy
      end
    end

    context 'with invalid name' do
      let(:school_unity) { build :school_unity, name: nil }
      it 'should be invalid' do
        expect(school_unity).to be_invalid
      end

      it 'should not be saved' do
        expect(school_unity.save).to be_falsey
      end
    end

    context 'with invalid address' do
      let(:school_unity) { build :school_unity, address: nil }
      it 'should be invalid' do
        expect(school_unity).to be_invalid
      end

      it 'should not be saved' do
        expect(school_unity.save).to be_falsey
      end
    end

    context 'and add a school' do
      let(:school_unity) { build :school_unity }
      let(:school) { create :school }
      it 'should have a school' do
        school_unity.school = school
        expect(school_unity.save).to be_truthy
        expect(school_unity.school.present?).to be_truthy
      end
    end

    context 'and add a school class' do
      let(:school_unity) { build :school_unity }
      let(:school_class) { create :school_class }
      it 'should increase school classes number' do
        school_unity.school_classes << school_class
        expect{school_unity.save}.to change(school_unity.school_classes, :count).by(1)
      end
    end
  end
end
