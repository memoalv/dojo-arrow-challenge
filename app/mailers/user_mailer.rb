class UserMailer < ApplicationMailer
  def welcome_email
    @user = params[:user]
    mail(to: @user.email, subject: 'Account registered correctly').deliver_later
  end

  def updated_account_email
    @user = params[:user]
    mail(to: @user.email, subject: 'Account updated correctly').deliver_later
  end
end
