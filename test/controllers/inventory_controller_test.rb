require "test_helper"

class InventoryControllerTest < ActionDispatch::IntegrationTest
  setup do
    @inventory = inventory(:one)
  end

  test "should get index" do
    get inventory_index_url
    assert_response :success
  end

  test "should get new" do
    get new_inventory_url
    assert_response :success
  end

  test "should create inventory" do
    assert_difference("Inventory.count") do
      post inventory_index_url, params: { inventory: { location_id: @inventory.location_id, name: @inventory.name } }
    end

    assert_redirected_to inventory_url(Inventory.last)
  end

  test "should show inventory" do
    get inventory_url(@inventory)
    assert_response :success
  end

  test "should get edit" do
    get edit_inventory_url(@inventory)
    assert_response :success
  end

  test "should update inventory" do
    patch inventory_url(@inventory), params: { inventory: { location_id: @inventory.location_id, name: @inventory.name } }
    assert_redirected_to inventory_url(@inventory)
  end

  test "should destroy inventory" do
    assert_difference("Inventory.count", -1) do
      delete inventory_url(@inventory)
    end

    assert_redirected_to inventory_index_url
  end
end
