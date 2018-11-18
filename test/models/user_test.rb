require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "User null camps" do
    user = User.new
    assert_not user.save, "All null Camps"
  end
end
