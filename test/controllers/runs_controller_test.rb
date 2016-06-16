# frozen_string_literal: true
require "test_helper"

# runs controller test
class RunsControllerTest < ActionController::TestCase
  setup do
    @run = runs(:one)
    @user = users(:one)
    sign_in @user
  end

  test "should get index" do
    get :index, user_id: @user.id
    assert_response :success
    assert_not_nil assigns(:runs)
  end

  test "should get new" do
    get :new, user_id: @user.id
    assert_response :success
  end

  test "should create run" do
    assert_difference("Run.count") do
      post :create, user_id: @user.id, run: {
        distance: @run.distance,
        occurred_at: @run.occurred_at,
        duration: @run.duration
      }
    end

    assert_redirected_to user_run_path(assigns(:run), user_id: @user.id)
  end

  test "should show run" do
    get :show, user_id: @user.id, id: @run
    assert_response :success
  end

  test "should get edit" do
    get :edit, user_id: @user.id, id: @run
    assert_response :success
  end

  test "should update run" do
    patch :update, user_id: @user.id, id: @run, run: {
      distance: @run.distance,
      occurred_at: @run.occurred_at,
      duration: @run.duration
    }
    assert_redirected_to user_run_path(assigns(:run), user_id: @user.id)
  end

  test "should destroy run" do
    assert_difference("Run.count", -1) do
      delete :destroy, user_id: @user.id, id: @run
    end

    assert_redirected_to user_runs_path
  end
end
