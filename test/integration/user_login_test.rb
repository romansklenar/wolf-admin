require 'test_helper'

class UserLoginTest < ActionDispatch::IntegrationTest

  test "redirect to login page for not logged in user" do
    visit root_path
    assert_equal new_user_session_path, current_path
  end

  test "redirect to admin page if logged in user" do
    user = FactoryGirl.create(:user)
    visit root_path
    within("#new_user") do
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: 'topsecret'
    end
    click_button 'Sign in'

    assert_equal root_path, current_path
  end

  test "redirect back to login if wrong user login" do
    user = FactoryGirl.create(:user)
    visit root_path
    within("#new_user") do
      fill_in 'user_email', with: 'randomstuff'
      fill_in 'user_password', with: 'randompass'
    end
    click_button 'Sign in'

    assert_equal new_user_session_path, current_path
  end

  test "redirect back to login page after user logout" do
    user = FactoryGirl.create(:user)
    visit root_path
    within("#new_user") do
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: 'topsecret'
    end
    click_button 'Sign in'
    assert_equal root_path, current_path

    find(:xpath, "//a[@href='/users/sign_out']").click
    assert_equal new_user_session_path, current_path
  end

end
