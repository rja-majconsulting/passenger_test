require 'test_helper'

class SportModulesControllerTest < ActionController::TestCase
  setup do
    @sport_module = sport_modules(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sport_modules)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sport_module" do
    assert_difference('SportModule.count') do
      post :create, sport_module: { activity_id: @sport_module.activity_id, coach_id: @sport_module.coach_id, code: @sport_module.code, day: @sport_module.day, endTime: @sport_module.endTime, maxSubscriptions: @sport_module.maxSubscriptions, meetingPlace: @sport_module.meetingPlace, place_id: @sport_module.place_id, startTime: @sport_module.startTime }
    end

    assert_redirected_to sport_module_path(assigns(:sport_module))
  end

  test "should show sport_module" do
    get :show, id: @sport_module
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sport_module
    assert_response :success
  end

  test "should update sport_module" do
    patch :update, id: @sport_module, sport_module: { activity_id: @sport_module.activity_id, coach_id: @sport_module.coach_id, code: @sport_module.code, day: @sport_module.day, endTime: @sport_module.endTime, maxSubscriptions: @sport_module.maxSubscriptions, meetingPlace: @sport_module.meetingPlace, place_id: @sport_module.place_id, startTime: @sport_module.startTime }
    assert_redirected_to sport_module_path(assigns(:sport_module))
  end

  test "should destroy sport_module" do
    assert_difference('SportModule.count', -1) do
      delete :destroy, id: @sport_module
    end

    assert_redirected_to sport_modules_path
  end
end
