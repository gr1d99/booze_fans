require 'rails_helper'

RSpec.describe AlcoholController, type: :controller do
  let(:json) { JSON.parse(response.body) }
  let(:valid_params) { attributes_for(:alcohol) }
  let(:name) { 'tusker' }
  let(:alcohol) { Alcohol.last }

  context '.create' do
    context 'with all parameters' do
      before(:each) { post :create, params: valid_params }

      it { expect(response.status).to eq(201) }

      it 'creates a new alcohol' do
        expect(alcohol.name).to eq(valid_params[:name])
        expect(alcohol.vv).to eq(valid_params[:vv])
      end
    end

    context 'when some parameters are missing' do
      before(:each) { post :create, params: { name: '', vv: '' } }

      it 'returns correct errors' do
        puts json.inspect
        expect(json['errors'].values).to include(["can't be blank"])
      end

      it { expect(response.status).to eq(422) }
      it { expect(Alcohol.find_by_name(name)).to be_nil }
    end
  end
end
