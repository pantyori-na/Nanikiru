require 'test_helper'

class Site::ReportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @site_report = site_reports(:one)
  end

  test "should get index" do
    get site_reports_url
    assert_response :success
  end

  test "should get new" do
    get new_site_report_url
    assert_response :success
  end

  test "should create site_report" do
    assert_difference('Site::Report.count') do
      post site_reports_url, params: { site_report: { comment: @site_report.comment, type: @site_report.type } }
    end

    assert_redirected_to site_report_url(Site::Report.last)
  end

  test "should show site_report" do
    get site_report_url(@site_report)
    assert_response :success
  end

  test "should get edit" do
    get edit_site_report_url(@site_report)
    assert_response :success
  end

  test "should update site_report" do
    patch site_report_url(@site_report), params: { site_report: { comment: @site_report.comment, type: @site_report.type } }
    assert_redirected_to site_report_url(@site_report)
  end

  test "should destroy site_report" do
    assert_difference('Site::Report.count', -1) do
      delete site_report_url(@site_report)
    end

    assert_redirected_to site_reports_url
  end
end
