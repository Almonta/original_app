require 'test_helper'

class CustomerContactsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get customer_contacts_create_url
    assert_response :success
  end

end
