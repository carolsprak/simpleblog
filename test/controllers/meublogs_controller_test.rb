require 'test_helper'

class MeublogsControllerTest < ActionController::TestCase
  setup do
    @meublog = meublogs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:meublogs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create meublog" do
    assert_difference('Meublog.count') do
      post :create, meublog: { title: @meublog.title, url: @meublog.url }
    end

    assert_redirected_to meublog_path(assigns(:meublog))
  end

  test "should show meublog" do
    get :show, id: @meublog
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @meublog
    assert_response :success
  end

  test "should update meublog" do
    patch :update, id: @meublog, meublog: { title: @meublog.title, url: @meublog.url }
    assert_redirected_to meublog_path(assigns(:meublog))
  end

  test "should destroy meublog" do
    assert_difference('Meublog.count', -1) do
      delete :destroy, id: @meublog
    end

    assert_redirected_to meublogs_path
  end
end
