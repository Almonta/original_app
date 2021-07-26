require 'test_helper'

class ProductDocumentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product_document = product_documents(:one)
  end

  test "should get index" do
    get product_documents_url
    assert_response :success
  end

  test "should get new" do
    get new_product_document_url
    assert_response :success
  end

  test "should create product_document" do
    assert_difference('ProductDocument.count') do
      post product_documents_url, params: { product_document: { content: @product_document.content, name: @product_document.name, product_id: @product_document.product_id, public_level: @product_document.public_level, user_id: @product_document.user_id } }
    end

    assert_redirected_to product_document_url(ProductDocument.last)
  end

  test "should show product_document" do
    get product_document_url(@product_document)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_document_url(@product_document)
    assert_response :success
  end

  test "should update product_document" do
    patch product_document_url(@product_document), params: { product_document: { content: @product_document.content, name: @product_document.name, product_id: @product_document.product_id, public_level: @product_document.public_level, user_id: @product_document.user_id } }
    assert_redirected_to product_document_url(@product_document)
  end

  test "should destroy product_document" do
    assert_difference('ProductDocument.count', -1) do
      delete product_document_url(@product_document)
    end

    assert_redirected_to product_documents_url
  end
end
