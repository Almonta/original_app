require "application_system_test_case"

class ProductDocumentsTest < ApplicationSystemTestCase
  setup do
    @product_document = product_documents(:one)
  end

  test "visiting the index" do
    visit product_documents_url
    assert_selector "h1", text: "Product Documents"
  end

  test "creating a Product document" do
    visit product_documents_url
    click_on "New Product Document"

    fill_in "Content", with: @product_document.content
    fill_in "Name", with: @product_document.name
    fill_in "Product", with: @product_document.product_id
    fill_in "Public level", with: @product_document.public_level
    fill_in "User", with: @product_document.user_id
    click_on "Create Product document"

    assert_text "Product document was successfully created"
    click_on "Back"
  end

  test "updating a Product document" do
    visit product_documents_url
    click_on "Edit", match: :first

    fill_in "Content", with: @product_document.content
    fill_in "Name", with: @product_document.name
    fill_in "Product", with: @product_document.product_id
    fill_in "Public level", with: @product_document.public_level
    fill_in "User", with: @product_document.user_id
    click_on "Update Product document"

    assert_text "Product document was successfully updated"
    click_on "Back"
  end

  test "destroying a Product document" do
    visit product_documents_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Product document was successfully destroyed"
  end
end
