require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "user should be valid" do
    assert FactoryGirl.build(:user).valid?
  end
  
  test "member should be valid" do
    assert FactoryGirl.build(:member).valid?
  end
  
  test "administrator should be valid" do
    assert FactoryGirl.build(:administrator).valid?
  end
end
