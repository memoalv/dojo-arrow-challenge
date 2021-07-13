require 'rails_helper'

RSpec.describe UserMailer, type: :mailer do
  let(:user) { create(:user, email: 'user@user_email.com') }
  let(:welcome_email) { UserMailer.with(user: user).welcome_email }
  let(:updated_account_email) { UserMailer.with(user: user).updated_account_email }

  before { clear_enqueued_jobs }

  context 'welcome email' do
    it 'sends the email in background job' do
      expect do
        UserMailer.with(user: user).welcome_email.deliver_later
      end.to have_enqueued_job.exactly(:once)
    end

    it 'has the correct information' do
      expect(welcome_email.from).to include 'guillermo@icalialabs.com'
      expect(welcome_email.to).to include user.email
      expect(welcome_email.subject).to eql 'Account registered correctly'
      expect(welcome_email.body.encoded).to include "Welcome Icalia arrows, #{user.name}"
      expect(welcome_email.body.encoded).to include "You can now log in to the application with the e-mail: #{user.email}"
      expect(welcome_email.body.encoded).to include 'Thanks for joining and have a great day!'
    end
  end

  context 'updated account email' do
    it 'sends update notification in background job' do
      expect do
        UserMailer.with(user: user).updated_account_email.deliver_later
      end.to have_enqueued_job.exactly(:once)
    end

    it 'has the correct information' do
      expect(updated_account_email.from).to include 'guillermo@icalialabs.com'
      expect(updated_account_email.to).to include user.email
      expect(updated_account_email.subject).to eql 'Account updated correctly'
      expect(updated_account_email.body.encoded).to include "Hello, #{user.name}"
      expect(updated_account_email.body.encoded).to include 'Your account info was updated correctly.'
    end
  end
end
