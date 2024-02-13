require "test_helper"

class VinylsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get vinyls_index_url
    assert_response :success
  end

  test "should get show" do
    get vinyls_show_url
    assert_response :success
  end

  test "should get create" do
    get vinyls_create_url
    assert_response :success
  end

  test "should get destroy" do
    get vinyls_destroy_url
    assert_response :success
  end

  test "should get edit" do
    get vinyls_edit_url
    assert_response :success
  end

  test "should get update" do
    get vinyls_update_url
    assert_response :success
  end

  test "should get new" do
    get vinyls_new_url
    assert_response :success
  end

  test "should get mine" do
    get vinyls_mine_url
    assert_response :success
  end
end
