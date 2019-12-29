require 'test_helper'

class BudgetGroupsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get budget_groups_new_url
    assert_response :success
  end

  test "should get index" do
    get budget_groups_index_url
    assert_response :success
  end

  test "should get edit" do
    get budget_groups_edit_url
    assert_response :success
  end

  test "should get show" do
    get budget_groups_show_url
    assert_response :success
  end

end
