require 'test_helper'

class ProductContactsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get product_contacts_create_url
    assert_response :success
  end
end
