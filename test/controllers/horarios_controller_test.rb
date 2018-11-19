require 'test_helper'
class HorariosControllerTest < ActionDispatch::IntegrationTest
    test "get all horarios" do 
        get "/api/v1/horarios"
        assert_response :success
    end
end