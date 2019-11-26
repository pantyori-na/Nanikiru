require 'test_helper'

class Site::PostCommentControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get site_post_comment_create_url
    assert_response :success
  end

  test "should get destroy" do
    get site_post_comment_destroy_url
    assert_response :success
  end

end
