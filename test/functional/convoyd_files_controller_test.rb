require 'test_helper'

class ConvoydFilesControllerTest < ActionController::TestCase
  setup do
    @convoyd_file = convoyd_files(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:convoyd_files)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create convoyd_file" do
    assert_difference('ConvoydFile.count') do
      post :create, convoyd_file: @convoyd_file.attributes
    end

    assert_redirected_to convoyd_file_path(assigns(:convoyd_file))
  end

  test "should show convoyd_file" do
    get :show, id: @convoyd_file.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @convoyd_file.to_param
    assert_response :success
  end

  test "should update convoyd_file" do
    put :update, id: @convoyd_file.to_param, convoyd_file: @convoyd_file.attributes
    assert_redirected_to convoyd_file_path(assigns(:convoyd_file))
  end

  test "should destroy convoyd_file" do
    assert_difference('ConvoydFile.count', -1) do
      delete :destroy, id: @convoyd_file.to_param
    end

    assert_redirected_to convoyd_files_path
  end
end
