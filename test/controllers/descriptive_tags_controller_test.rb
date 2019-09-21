require 'test_helper'

class DescriptiveTagsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get descriptive_tags_index_url
    assert_response :success
  end

  test "should get new" do
    get descriptive_tags_new_url
    assert_response :success
  end

  test "should get create" do
    get descriptive_tags_create_url
    assert_response :success
  end

  test "should get show" do
    get descriptive_tags_show_url
    assert_response :success
  end

  test "should get update" do
    get descriptive_tags_update_url
    assert_response :success
  end

  test "should get destroy" do
    get descriptive_tags_destroy_url
    assert_response :success
  end

  test "should get edit" do
    get descriptive_tags_edit_url
    assert_response :success
  end

end
