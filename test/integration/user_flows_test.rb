require 'test_helper'

class UserFlowsTest < ActionDispatch::IntegrationTest
  fixtures :users
  
  def test_sign_in_to_the_site 

    post_via_redirect 'users/sign_in', 'user[email]' => 'foo@bar.com', 'user[password]' => 'qwerty'
    assert_equal '/users/sign_in', path
    
    https!(false)
    get "entries"
    assert_response :success
  end
end