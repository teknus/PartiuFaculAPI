require 'test_helper'

class LoginTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "invalid without token" do
    login = Login.new
    assert_not login.save, "All null Camps"
  end
end
