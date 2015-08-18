module SessionHelper

  def login_as_role(role_name)
    user = FactoryGirl.create(role_name)
    login_as user, scope: :user
    visit deals_path
  end

end
