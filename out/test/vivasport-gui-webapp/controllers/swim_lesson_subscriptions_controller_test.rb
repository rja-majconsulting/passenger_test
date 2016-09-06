require 'test_helper'

class SwimLessonSubscriptionsControllerTest < ActionController::TestCase
  setup do
    @swim_lesson_subscription = swim_lesson_subscriptions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:swim_lesson_subscriptions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create swim_lesson_subscription" do
    assert_difference('SwimLessonSubscription.count') do
      post :create, swim_lesson_subscription: {  }
    end

    assert_redirected_to swim_lesson_subscription_path(assigns(:swim_lesson_subscription))
  end

  test "should show swim_lesson_subscription" do
    get :show, id: @swim_lesson_subscription
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @swim_lesson_subscription
    assert_response :success
  end

  test "should update swim_lesson_subscription" do
    patch :update, id: @swim_lesson_subscription, swim_lesson_subscription: {  }
    assert_redirected_to swim_lesson_subscription_path(assigns(:swim_lesson_subscription))
  end

  test "should destroy swim_lesson_subscription" do
    assert_difference('SwimLessonSubscription.count', -1) do
      delete :destroy, id: @swim_lesson_subscription
    end

    assert_redirected_to swim_lesson_subscriptions_path
  end
end
