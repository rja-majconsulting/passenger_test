require 'test_helper'

class SportsDaySubscriptionsControllerTest < ActionController::TestCase
  setup do
    @sports_day_subscription = sports_day_subscriptions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sports_day_subscriptions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sports_day_subscription" do
    assert_difference('SportsDaySubscription.count') do
      post :create, sports_day_subscription: {  }
    end

    assert_redirected_to sports_day_subscription_path(assigns(:sports_day_subscription))
  end

  test "should show sports_day_subscription" do
    get :show, id: @sports_day_subscription
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sports_day_subscription
    assert_response :success
  end

  test "should update sports_day_subscription" do
    patch :update, id: @sports_day_subscription, sports_day_subscription: {  }
    assert_redirected_to sports_day_subscription_path(assigns(:sports_day_subscription))
  end

  test "should destroy sports_day_subscription" do
    assert_difference('SportsDaySubscription.count', -1) do
      delete :destroy, id: @sports_day_subscription
    end

    assert_redirected_to sports_day_subscriptions_path
  end
end
