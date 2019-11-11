require "application_system_test_case"

class GameRecordsTest < ApplicationSystemTestCase
  setup do
    @game_record = game_records(:one)
  end

  test "visiting the index" do
    visit game_records_url
    assert_selector "h1", text: "Game Records"
  end

  test "creating a Game record" do
    visit game_records_url
    click_on "New Game Record"

    fill_in "Ability", with: @game_record.ability
    fill_in "Game name", with: @game_record.game_name
    fill_in "Handle name", with: @game_record.handle_name
    fill_in "Type", with: @game_record.type
    fill_in "User", with: @game_record.user_id
    click_on "Create Game record"

    assert_text "Game record was successfully created"
    click_on "Back"
  end

  test "updating a Game record" do
    visit game_records_url
    click_on "Edit", match: :first

    fill_in "Ability", with: @game_record.ability
    fill_in "Game name", with: @game_record.game_name
    fill_in "Handle name", with: @game_record.handle_name
    fill_in "Type", with: @game_record.type
    fill_in "User", with: @game_record.user_id
    click_on "Update Game record"

    assert_text "Game record was successfully updated"
    click_on "Back"
  end

  test "destroying a Game record" do
    visit game_records_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Game record was successfully destroyed"
  end
end
