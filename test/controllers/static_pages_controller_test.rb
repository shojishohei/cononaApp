require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get static_pages_home_url
    assert_response :success
  end

  test "should get about" do
    get static_pages_about_url
    assert_response :success
  end

  test "should get create" do
    get static_pages_create_url
    assert_response :success
  end

  test "should get update" do
    get static_pages_update_url
    assert_response :success
  end

  test "should get show" do
    get static_pages_show_url
    assert_response :success
  end

end
