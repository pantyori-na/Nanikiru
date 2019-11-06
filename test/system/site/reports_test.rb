require "application_system_test_case"

class Site::ReportsTest < ApplicationSystemTestCase
  setup do
    @site_report = site_reports(:one)
  end

  test "visiting the index" do
    visit site_reports_url
    assert_selector "h1", text: "Site/Reports"
  end

  test "creating a Report" do
    visit site_reports_url
    click_on "New Site/Report"

    fill_in "Comment", with: @site_report.comment
    fill_in "Type", with: @site_report.type
    click_on "Create Report"

    assert_text "Report was successfully created"
    click_on "Back"
  end

  test "updating a Report" do
    visit site_reports_url
    click_on "Edit", match: :first

    fill_in "Comment", with: @site_report.comment
    fill_in "Type", with: @site_report.type
    click_on "Update Report"

    assert_text "Report was successfully updated"
    click_on "Back"
  end

  test "destroying a Report" do
    visit site_reports_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Report was successfully destroyed"
  end
end
