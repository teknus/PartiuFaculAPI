require 'test_helper'
class UsersControllerTest < ActionDispatch::IntegrationTest
    test "get all users" do 
        get "/api/v1/users"
        assert_response :success
    end

    test "should show user" do
        get "/api/v1/users/1"
        assert_response :success
    end
end