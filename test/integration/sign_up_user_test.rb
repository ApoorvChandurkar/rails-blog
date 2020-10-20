require 'test_helper'

class SignUpUserTest < ActionDispatch::IntegrationTest
  
  test "new user should be signed up" do
    get '/signup'
    assert_response :success
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { username: "apoorv", email: "a@g.com", password: "password" } }
      assert_response :redirect    
    end
    follow_redirect!
    assert_response :success
    assert_match "apoorv's", response.body, "didn't match the name"


  end
end
