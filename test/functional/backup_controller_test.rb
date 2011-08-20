require 'test_helper'

class BackupControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
