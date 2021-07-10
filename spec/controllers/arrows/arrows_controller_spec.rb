require 'rails_helper'

RSpec.describe Arrows::ArrowsController, type: :controller do
  let(:user) { create(:user) }

  describe '#index' do
    context 'when user is not authenticated' do
      it 'raises a routing error' do
        get :index
        expect(response).not_to be_successful
      end
    end

    context 'when user is authenticated' do
      it 'user can GET index' do
        sign_in user

        get :index

        expect(response).to be_successful
      end
    end
  end
end
