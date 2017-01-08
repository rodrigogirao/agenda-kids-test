require 'rails_helper'

RSpec.describe Responsible, type: :model do
  describe 'When create responsible' do
    context 'with valid fields' do
      let(:responsible) { build :responsible }
      it 'should be valid' do
        expect(responsible).to be_valid
      end

      it 'should be saved' do
        expect(responsible.save).to be_truthy
      end
    end

    context 'with invalid name' do
      let(:responsible) { build :responsible, name: nil }
      it 'should be invalid' do
        expect(responsible).to be_invalid
      end

      it 'should not be saved' do
        expect(responsible.save).to be_falsey
      end
    end

    context 'with invalid email' do
      let(:responsible) { build :responsible, email: nil }
      it 'should be invalid' do
        expect(responsible).to be_invalid
      end

      it 'should not be saved' do
        expect(responsible.save).to be_falsey
      end
    end

    context 'and add a student' do
      let(:responsible) { build :responsible }
      let(:student) { create :student }
      it 'should increase students number' do
        responsible.students << student
        expect { responsible.save }.to change(responsible.students, :count).by(1)
      end
    end
  end
end
