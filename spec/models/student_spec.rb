require 'rails_helper'

RSpec.describe Student, type: :model do
  describe 'When create student' do
    context 'with valid fields' do
      let(:student) { build :student }
      it 'should be valid' do
        expect(student).to be_valid
      end

      it 'should be saved' do
        expect(student.save).to be_truthy
      end
    end

    context 'with invalid name' do
      let(:student) { build :student, name: nil }
      it 'should be invalid' do
        expect(student).to be_invalid
      end

      it 'should not be saved' do
        expect(student.save).to be_falsey
      end
    end

    context 'with invalid registration' do
      let(:student) { build :student, registration: nil }
      it 'should be invalid' do
        expect(student).to be_invalid
      end

      it 'should not be saved' do
        expect(student.save).to be_falsey
      end
    end

    context 'and add a school class' do
      let(:student) { build :student }
      let(:school_class) { create :school_class }
      it 'should increase school classes number' do
        student.school_classes << school_class
        expect{student.save}.to change(student.school_classes, :count).by(1)
      end
    end

    context 'and add a responsible' do
      let(:student) { build :student }
      let(:responsible) { create :responsible }
      it 'should increase responsibles number' do
        student.responsibles << responsible
        expect{student.save}.to change(student.responsibles, :count).by(1)
      end
    end
  end
end
