require 'test_helper'

class SportModuleSubscriptionsControllerTest < ActionController::TestCase
  setup do
    @sport_module_subscription = sport_module_subscriptions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sport_module_subscriptions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sport_module_subscription" do
    assert_difference('SportModuleSubscription.count') do
      post :create, sport_module_subscription: {  }
    end

    assert_redirected_to sport_module_subscription_path(assigns(:sport_module_subscription))
  end

  test "should show sport_module_subscription" do
    get :show, id: @sport_module_subscription
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sport_module_subscription
    assert_response :success
  end

  test "should update sport_module_subscription" do
    patch :update, id: @sport_module_subscription, sport_module_subscription: {  }
    assert_redirected_to sport_module_subscription_path(assigns(:sport_module_subscription))
  end

  test "should destroy sport_module_subscription" do
    assert_difference('SportModuleSubscription.count', -1) do
      delete :destroy, id: @sport_module_subscription
    end

    assert_redirected_to sport_module_subscriptions_path
  end
end
