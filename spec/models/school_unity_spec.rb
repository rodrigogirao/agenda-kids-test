require 'rails_helper'

RSpec.describe SchoolUnity, type: :model do
  describe 'When create school_unity' do
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
      let(:school_unity) { build :school, name: nil }
      it 'should be invalid' do
        expect(school_unity).to be_invalid
      end

      it 'should not be saved' do
        expect(school_unity.save).to be_falsey
      end
    end

    context 'with invalid cnpj' do
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
      it 'should had a school' do
        school_unity.school = school
        expect(school_unity.save).to be_truthy
        expect(school_unity.school.present?).to be_truthy
      end
    end
  end
end
