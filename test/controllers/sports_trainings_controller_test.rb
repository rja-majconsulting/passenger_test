require 'test_helper'

class SportsTrainingsControllerTest < ActionController::TestCase
  setup do
    @sports_training = sports_trainings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sports_trainings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sports_training" do
    assert_difference('SportsTraining.count') do
      post :create, sports_training: { afternoonNursery: @sports_training.afternoonNursery, code: @sports_training.code, endDate: @sports_training.endDate, endTime: @sports_training.endTime, fullDayPrice: @sports_training.fullDayPrice, halfDayPrice: @sports_training.halfDayPrice, morningNursery: @sports_training.morningNursery, place_id: @sports_training.place_id, startDate: @sports_training.startDate, startTime: @sports_training.startTime }
    end

    assert_redirected_to sports_training_path(assigns(:sports_training))
  end

  test "should show sports_training" do
    get :show, id: @sports_training
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sports_training
    assert_response :success
  end

  test "should update sports_training" do
    patch :update, id: @sports_training, sports_training: { afternoonNursery: @sports_training.afternoonNursery, code: @sports_training.code, endDate: @sports_training.endDate, endTime: @sports_training.endTime, fullDayPrice: @sports_training.fullDayPrice, halfDayPrice: @sports_training.halfDayPrice, morningNursery: @sports_training.morningNursery, place_id: @sports_training.place_id, startDate: @sports_training.startDate, startTime: @sports_training.startTime }
    assert_redirected_to sports_training_path(assigns(:sports_training))
  end

  test "should destroy sports_training" do
    assert_difference('SportsTraining.count', -1) do
      delete :destroy, id: @sports_training
    end

    assert_redirected_to sports_trainings_path
  end
end
