require 'rails_helper'

RSpec.describe Users::RegistrationsController, type: :controller do
  let(:user) { create(:user) }

  before { @request.env['devise.mapping'] = Devise.mappings[:user] }

  # describe 'PUT #update' do
  #   it 'calls the send_updated_account_email method' do
  #     sign_in user
  #     update_form_attributes = {
  #       name: 'new name',
  #       email: 'new_email@email.com',
  #       password_confirmation: 'crazy_pwd'
  #     }

  #     # expect(Users::RegistrationsController).to receive(:send_updated_account_email)

  #     put :update, params: { user: update_form_attributes }

  #     expect(response.status).to eq(200)
  #     # puts controller.current_user.name #! rip
  #   end
  # end

  # describe 'POST #create' do
  #   it 'calls the send_welcome_email method' do
  #     update_form_attributes = {
  #       name: 'new name',
  #       email: 'new_email@email.com',
  #       confirmation: 'crazy_pwd',
  #       password_confirmation: 'crazy_pwd'
  #     }

  #     # expect(Users::RegistrationsController).to receive(:send_welcome_email)

  #     post :create, params: { user: update_form_attributes }

  #     expect(response.status).to eq(200)
  #   end
  # end
end
