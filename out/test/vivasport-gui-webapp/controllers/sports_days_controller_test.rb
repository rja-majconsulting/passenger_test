require 'test_helper'

class SportsDaysControllerTest < ActionController::TestCase
  setup do
    @sports_day = sports_days(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sports_days)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sports_day" do
    assert_difference('SportsDay.count') do
      post :create, sports_day: { afternoonPlace: @sports_day.afternoonPlace, code: @sports_day.code, date: @sports_day.date, endTime: @sports_day.endTime, morningPlace: @sports_day.morningPlace, place_id: @sports_day.place_id, price: @sports_day.price, startTime: @sports_day.startTime }
    end

    assert_redirected_to sports_day_path(assigns(:sports_day))
  end

  test "should show sports_day" do
    get :show, id: @sports_day
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sports_day
    assert_response :success
  end

  test "should update sports_day" do
    patch :update, id: @sports_day, sports_day: { afternoonPlace: @sports_day.afternoonPlace, code: @sports_day.code, date: @sports_day.date, endTime: @sports_day.endTime, morningPlace: @sports_day.morningPlace, place_id: @sports_day.place_id, price: @sports_day.price, startTime: @sports_day.startTime }
    assert_redirected_to sports_day_path(assigns(:sports_day))
  end

  test "should destroy sports_day" do
    assert_difference('SportsDay.count', -1) do
      delete :destroy, id: @sports_day
    end

    assert_redirected_to sports_days_path
  end
end
