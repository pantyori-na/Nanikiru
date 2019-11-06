require 'test_helper'

class PostImagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post_image = post_images(:one)
  end

  test "should get index" do
    get post_images_url
    assert_response :success
  end

  test "should get new" do
    get new_post_image_url
    assert_response :success
  end

  test "should create post_image" do
    assert_difference('PostImage.count') do
      post post_images_url, params: { post_image: { comment: @post_image.comment, image_id: @post_image.image_id, type: @post_image.type, user_id: @post_image.user_id } }
    end

    assert_redirected_to post_image_url(PostImage.last)
  end

  test "should show post_image" do
    get post_image_url(@post_image)
    assert_response :success
  end

  test "should get edit" do
    get edit_post_image_url(@post_image)
    assert_response :success
  end

  test "should update post_image" do
    patch post_image_url(@post_image), params: { post_image: { comment: @post_image.comment, image_id: @post_image.image_id, type: @post_image.type, user_id: @post_image.user_id } }
    assert_redirected_to post_image_url(@post_image)
  end

  test "should destroy post_image" do
    assert_difference('PostImage.count', -1) do
      delete post_image_url(@post_image)
    end

    assert_redirected_to post_images_url
  end
end
