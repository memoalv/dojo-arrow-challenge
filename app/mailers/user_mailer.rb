class UserMailer < ApplicationMailer
  def welcome_email
    @user = params[:user]
    mail(to: @user.email, subject: 'Account registered correctly')
  end

  def updated_account_email
    @user = params[:user]
    mail(to: @user.email, subject: 'Account updated correctly')
  end
end
