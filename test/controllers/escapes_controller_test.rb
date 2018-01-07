require 'test_helper'

class EscapesControllerTest < ActionController::TestCase
  setup do
    @escape = escapes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:escapes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create escape" do
    assert_difference('Escape.count') do
      post :create, escape: { contents: @escape.contents, title: @escape.title, user_id: @escape.user_id }
    end

    assert_redirected_to escape_path(assigns(:escape))
  end

  test "should show escape" do
    get :show, id: @escape
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @escape
    assert_response :success
  end

  test "should update escape" do
    patch :update, id: @escape, escape: { contents: @escape.contents, title: @escape.title, user_id: @escape.user_id }
    assert_redirected_to escape_path(assigns(:escape))
  end

  test "should destroy escape" do
    assert_difference('Escape.count', -1) do
      delete :destroy, id: @escape
    end

    assert_redirected_to escapes_path
  end
end
