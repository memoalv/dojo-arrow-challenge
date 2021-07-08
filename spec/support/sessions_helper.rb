def sign_in(user)
  visit new_user_session_path
  fill_in "user_email", with: user.email
  fill_in "user_password", with: "crazy_pwd"
  click_on "Log in"
end
