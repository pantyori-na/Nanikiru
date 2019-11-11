require "application_system_test_case"

class PostImagesTest < ApplicationSystemTestCase
  setup do
    @post_image = post_images(:one)
  end

  test "visiting the index" do
    visit post_images_url
    assert_selector "h1", text: "Post Images"
  end

  test "creating a Post image" do
    visit post_images_url
    click_on "New Post Image"

    fill_in "Comment", with: @post_image.comment
    fill_in "Image", with: @post_image.image_id
    fill_in "Type", with: @post_image.type
    fill_in "User", with: @post_image.user_id
    click_on "Create Post image"

    assert_text "Post image was successfully created"
    click_on "Back"
  end

  test "updating a Post image" do
    visit post_images_url
    click_on "Edit", match: :first

    fill_in "Comment", with: @post_image.comment
    fill_in "Image", with: @post_image.image_id
    fill_in "Type", with: @post_image.type
    fill_in "User", with: @post_image.user_id
    click_on "Update Post image"

    assert_text "Post image was successfully updated"
    click_on "Back"
  end

  test "destroying a Post image" do
    visit post_images_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Post image was successfully destroyed"
  end
end
