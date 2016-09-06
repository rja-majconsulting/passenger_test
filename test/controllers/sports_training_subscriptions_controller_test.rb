require 'test_helper'

class SportsTrainingSubscriptionsControllerTest < ActionController::TestCase
  setup do
    @sports_training_subscription = sports_training_subscriptions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sports_training_subscriptions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sports_training_subscription" do
    assert_difference('SportsTrainingSubscription.count') do
      post :create, sports_training_subscription: {  }
    end

    assert_redirected_to sports_training_subscription_path(assigns(:sports_training_subscription))
  end

  test "should show sports_training_subscription" do
    get :show, id: @sports_training_subscription
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sports_training_subscription
    assert_response :success
  end

  test "should update sports_training_subscription" do
    patch :update, id: @sports_training_subscription, sports_training_subscription: {  }
    assert_redirected_to sports_training_subscription_path(assigns(:sports_training_subscription))
  end

  test "should destroy sports_training_subscription" do
    assert_difference('SportsTrainingSubscription.count', -1) do
      delete :destroy, id: @sports_training_subscription
    end

    assert_redirected_to sports_training_subscriptions_path
  end
end
