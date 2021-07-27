require 'test_helper'

class CustomerDocumentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @customer_document = customer_documents(:one)
  end

  test "should get index" do
    get customer_documents_url
    assert_response :success
  end

  test "should get new" do
    get new_customer_document_url
    assert_response :success
  end

  test "should create customer_document" do
    assert_difference('CustomerDocument.count') do
      post customer_documents_url, params: { customer_document: { content: @customer_document.content, customer_id: @customer_document.customer_id, name: @customer_document.name, public_level: @customer_document.public_level, user_id: @customer_document.user_id } }
    end

    assert_redirected_to customer_document_url(CustomerDocument.last)
  end

  test "should show customer_document" do
    get customer_document_url(@customer_document)
    assert_response :success
  end

  test "should get edit" do
    get edit_customer_document_url(@customer_document)
    assert_response :success
  end

  test "should update customer_document" do
    patch customer_document_url(@customer_document), params: { customer_document: { content: @customer_document.content, customer_id: @customer_document.customer_id, name: @customer_document.name, public_level: @customer_document.public_level, user_id: @customer_document.user_id } }
    assert_redirected_to customer_document_url(@customer_document)
  end

  test "should destroy customer_document" do
    assert_difference('CustomerDocument.count', -1) do
      delete customer_document_url(@customer_document)
    end

    assert_redirected_to customer_documents_url
  end
end
