require 'rails_helper'

RSpec.describe Teacher, type: :model do
  describe 'When create teacher' do
    context 'with valid fields' do
      let(:teacher) { build :teacher }
      it 'should be valid' do
        expect(teacher).to be_valid
      end

      it 'should be saved' do
        expect(teacher.save).to be_truthy
      end
    end

    context 'with invalid name' do
      let(:teacher) { build :teacher, name: nil }
      it 'should be invalid' do
        expect(teacher).to be_invalid
      end

      it 'should not be saved' do
        expect(teacher.save).to be_falsey
      end
    end

    context 'with invalid registration' do
      let(:teacher) { build :teacher, registration: nil }
      it 'should be invalid' do
        expect(teacher).to be_invalid
      end

      it 'should not be saved' do
        expect(teacher.save).to be_falsey
      end
    end

    context 'and add a schools class' do
      let(:teacher) { build :teacher }
      let(:school_unity) { create :school_unity }
      it 'should increase schools unities number' do
        teacher.school_unities << school_unity
        expect{teacher.save}.to change(teacher.school_unities, :count).by(1)
      end
    end
  end
end
