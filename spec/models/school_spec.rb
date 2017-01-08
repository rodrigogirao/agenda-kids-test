require 'rails_helper'

RSpec.describe School, type: :model do
  describe 'When create schools' do
    context 'with valid fields' do
      let(:schools) { build :schools}
      it 'should be valid' do
        expect(school).to be_valid
      end

      it 'should be saved' do
        expect(school.save).to be_truthy
      end
    end

    context 'with invalid name' do
      let(:schools) { build :schools, name: nil}
      it 'should be invalid' do
        expect(school).to be_invalid
      end

      it 'should not be saved' do
        expect(school.save).to be_falsey
      end
    end

    context 'with invalid cnpj' do
      let(:schools) { build :schools, cnpj: nil}
      it 'should be invalid' do
        expect(school).to be_invalid
      end

      it 'should not be saved' do
        expect(school.save).to be_falsey
      end
    end

    context 'and add a schools unity' do
      let(:schools) { build :schools }
      let(:school_unity) { create :school_unity }
      it 'should increase schools unities number' do
        school.school_unities << school_unity
        expect{school.save}.to change(school.school_unities, :count).by(1)
      end
    end

  end
end
