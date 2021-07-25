require 'test_helper'

class RegisteredProjectsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get registered_projects_index_url
    assert_response :success
  end
end
