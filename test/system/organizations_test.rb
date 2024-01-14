require "application_system_test_case"

class OrganizationsTest < ApplicationSystemTestCase
  setup do
    @organization = organizations(:one)
  end

  test "visiting the index" do
    visit organizations_url
    assert_selector "h1", text: "Organizations"
  end

  test "should create organization" do
    visit organizations_url
    click_on "New organization"

    fill_in "Address", with: @organization.address
    fill_in "Agreement at", with: @organization.agreement_at
    fill_in "Email", with: @organization.email
    fill_in "Fax", with: @organization.fax
    fill_in "Name", with: @organization.name
    fill_in "Pic", with: @organization.pic
    fill_in "Postal code", with: @organization.postal_code
    fill_in "Tel", with: @organization.tel
    click_on "Create Organization"

    assert_text "Organization was successfully created"
    click_on "Back"
  end

  test "should update Organization" do
    visit organization_url(@organization)
    click_on "Edit this organization", match: :first

    fill_in "Address", with: @organization.address
    fill_in "Agreement at", with: @organization.agreement_at
    fill_in "Email", with: @organization.email
    fill_in "Fax", with: @organization.fax
    fill_in "Name", with: @organization.name
    fill_in "Pic", with: @organization.pic
    fill_in "Postal code", with: @organization.postal_code
    fill_in "Tel", with: @organization.tel
    click_on "Update Organization"

    assert_text "Organization was successfully updated"
    click_on "Back"
  end

  test "should destroy Organization" do
    visit organization_url(@organization)
    click_on "Destroy this organization", match: :first

    assert_text "Organization was successfully destroyed"
  end
end
