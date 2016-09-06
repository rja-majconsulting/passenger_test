require 'test_helper'

class SwimLessonsControllerTest < ActionController::TestCase
  setup do
    @swim_lesson = swim_lessons(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:swim_lessons)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create swim_lesson" do
    assert_difference('SwimLesson.count') do
      post :create, swim_lesson: { coach_id: @swim_lesson.coach_id, code: @swim_lesson.code, day: @swim_lesson.day, endTime: @swim_lesson.endTime, level_id: @swim_lesson.level_id, maxSubscriptions: @swim_lesson.maxSubscriptions, place_id: @swim_lesson.place_id, startTime: @swim_lesson.startTime }
    end

    assert_redirected_to swim_lesson_path(assigns(:swim_lesson))
  end

  test "should show swim_lesson" do
    get :show, id: @swim_lesson
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @swim_lesson
    assert_response :success
  end

  test "should update swim_lesson" do
    patch :update, id: @swim_lesson, swim_lesson: { coach_id: @swim_lesson.coach_id, code: @swim_lesson.code, day: @swim_lesson.day, endTime: @swim_lesson.endTime, level_id: @swim_lesson.level_id, maxSubscriptions: @swim_lesson.maxSubscriptions, place_id: @swim_lesson.place_id, startTime: @swim_lesson.startTime }
    assert_redirected_to swim_lesson_path(assigns(:swim_lesson))
  end

  test "should destroy swim_lesson" do
    assert_difference('SwimLesson.count', -1) do
      delete :destroy, id: @swim_lesson
    end

    assert_redirected_to swim_lessons_path
  end
end
