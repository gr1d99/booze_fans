require 'rails_helper'

RSpec.describe Alcohol, type: :model do
  context 'when all attributes are provided' do
    let!(:alcohol) { build(:alcohol, name: 'jameson', vv: '37.5') }

    it 'is valid' do
      expect(alcohol.valid?).to be_truthy
    end
  end

  context 'when some attributes are missing' do
    context 'name' do
      let!(:alcohol) { build(:alcohol, name: '', vv: '10') }

      it 'is invalid' do
        expect(alcohol.valid?).not_to be_truthy
      end
    end

    context 'vv' do
      let!(:alcohol) { build(:alcohol, name: 'jameson', vv: '') }

      it 'is invalid' do
        expect(alcohol.valid?).not_to be_truthy
      end
    end
  end
end
