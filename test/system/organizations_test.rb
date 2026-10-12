require "application_system_test_case"

class OrganizationsTest < ApplicationSystemTestCase
  setup do
    @organization = organizations(:one)
  end

  test "visiting the index" do
    visit organizations_url
    assert_selector "h1", text: "団体一覧"
  end

  test "should create organization" do
    visit organizations_url
    click_on "団体新規登録", match: :first

    fill_in "所在地", with: @organization.address
    fill_in "許可日", with: @organization.agreement_at
    fill_in "Email", with: @organization.email
    fill_in "Fax", with: @organization.fax
    fill_in "団体名", with: @organization.name
    fill_in "担当者", with: @organization.pic
    fill_in "郵便番号", with: @organization.postal_code
    fill_in "電話", with: @organization.tel
    click_button

    assert_text "Organization was successfully created"
    click_on "一覧に戻る"
  end

  test "should update Organization" do
    visit organization_url(@organization)
    click_on "編集", match: :first

    fill_in "所在地", with: @organization.address
    fill_in "許可日", with: @organization.agreement_at
    fill_in "Email", with: @organization.email
    fill_in "Fax", with: @organization.fax
    fill_in "団体名", with: @organization.name
    fill_in "担当者", with: @organization.pic
    fill_in "郵便番号", with: @organization.postal_code
    fill_in "電話", with: @organization.tel
    click_button

    assert_text "Organization was successfully updated"
    click_on "一覧に戻る"
  end

  test "should destroy Organization" do
    visit organization_url(@organization)
    click_on "削除", match: :first

    assert_text "Organization was successfully destroyed"
  end
end
