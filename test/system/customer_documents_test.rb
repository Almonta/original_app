require "application_system_test_case"

class CustomerDocumentsTest < ApplicationSystemTestCase
  setup do
    @customer_document = customer_documents(:one)
  end

  test "visiting the index" do
    visit customer_documents_url
    assert_selector "h1", text: "Customer Documents"
  end

  test "creating a Customer document" do
    visit customer_documents_url
    click_on "New Customer Document"

    fill_in "Content", with: @customer_document.content
    fill_in "Customer", with: @customer_document.customer_id
    fill_in "Name", with: @customer_document.name
    fill_in "Public level", with: @customer_document.public_level
    fill_in "User", with: @customer_document.user_id
    click_on "Create Customer document"

    assert_text "Customer document was successfully created"
    click_on "Back"
  end

  test "updating a Customer document" do
    visit customer_documents_url
    click_on "Edit", match: :first

    fill_in "Content", with: @customer_document.content
    fill_in "Customer", with: @customer_document.customer_id
    fill_in "Name", with: @customer_document.name
    fill_in "Public level", with: @customer_document.public_level
    fill_in "User", with: @customer_document.user_id
    click_on "Update Customer document"

    assert_text "Customer document was successfully updated"
    click_on "Back"
  end

  test "destroying a Customer document" do
    visit customer_documents_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Customer document was successfully destroyed"
  end
end
