require 'test_helper'

class ShopAttachmentsControllerTest < ActionController::TestCase
  setup do
    @shop_attachment = shop_attachments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shop_attachments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shop_attachment" do
    assert_difference('ShopAttachment.count') do
      post :create, shop_attachment: { avatar: @shop_attachment.avatar, shop_id: @shop_attachment.shop_id }
    end

    assert_redirected_to shop_attachment_path(assigns(:shop_attachment))
  end

  test "should show shop_attachment" do
    get :show, id: @shop_attachment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @shop_attachment
    assert_response :success
  end

  test "should update shop_attachment" do
    patch :update, id: @shop_attachment, shop_attachment: { avatar: @shop_attachment.avatar, shop_id: @shop_attachment.shop_id }
    assert_redirected_to shop_attachment_path(assigns(:shop_attachment))
  end

  test "should destroy shop_attachment" do
    assert_difference('ShopAttachment.count', -1) do
      delete :destroy, id: @shop_attachment
    end

    assert_redirected_to shop_attachments_path
  end
end
