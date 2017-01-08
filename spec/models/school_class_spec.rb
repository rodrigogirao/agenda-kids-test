require 'rails_helper'

RSpec.describe SchoolClass, type: :model do
  describe 'When create schools class' do
    context 'with valid fields' do
      let(:school_class) { build :school_class }
      it 'should be valid' do
        expect(school_class).to be_valid
      end

      it 'should be saved' do
        expect(school_class.save).to be_truthy
      end
    end

    context 'with invalid name' do
      let(:school_class) { build :school_class, name: nil }
      it 'should be invalid' do
        expect(school_class).to be_invalid
      end

      it 'should not be saved' do
        expect(school_class.save).to be_falsey
      end
    end

    context 'with invalid shift' do
      let(:school_class) { build :school_class, shift: nil }
      it 'should be invalid' do
        expect(school_class).to be_invalid
      end

      it 'should not be saved' do
        expect(school_class.save).to be_falsey
      end
    end

    context 'and add a schools unity' do
      let(:school_class) { build :school_class }
      let(:school_unity) { create :school_unity }
      it 'should had a schools unity' do
        school_class.school_unity = school_unity
        expect(school_class.save).to be_truthy
        expect(school_class.school_unity.present?).to be_truthy
      end
    end

    context 'and add a student' do
      let(:school_class) { build :school_class }
      let(:student) { create :student }
      it 'should increase students number' do
        school_class.students << student
        expect{school_class.save}.to change(school_class.students, :count).by(1)
      end
    end
  end
end
