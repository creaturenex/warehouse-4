require "application_system_test_case"

class InventoryTest < ApplicationSystemTestCase
  setup do
    @inventory = inventory(:one)
  end

  test "visiting the index" do
    visit inventory_url
    assert_selector "h1", text: "Inventory"
  end

  test "should create inventory" do
    visit inventory_url
    click_on "New inventory"

    fill_in "Location", with: @inventory.location_id
    fill_in "Name", with: @inventory.name
    click_on "Create Inventory"

    assert_text "Inventory was successfully created"
    click_on "Back"
  end

  test "should update Inventory" do
    visit inventory_url(@inventory)
    click_on "Edit this inventory", match: :first

    fill_in "Location", with: @inventory.location_id
    fill_in "Name", with: @inventory.name
    click_on "Update Inventory"

    assert_text "Inventory was successfully updated"
    click_on "Back"
  end

  test "should destroy Inventory" do
    visit inventory_url(@inventory)
    click_on "Destroy this inventory", match: :first

    assert_text "Inventory was successfully destroyed"
  end
end
