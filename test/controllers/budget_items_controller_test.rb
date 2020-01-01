require 'test_helper'

class BudgetItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get budget_items_new_url
    assert_response :success
  end

  test "should get create" do
    get budget_items_create_url
    assert_response :success
  end

  test "should get show" do
    get budget_items_show_url
    assert_response :success
  end

  test "should get edit" do
    get budget_items_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get budget_items_destroy_url
    assert_response :success
  end

end
