# frozen_string_literal: true
require "test_helper"

# runs controller test
class RunsControllerTest < ActionController::TestCase
  setup do
    @run = runs(:one)
    sign_in users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:runs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create run" do
    assert_difference("Run.count") do
      post :create, run: {
        distance: @run.distance,
        occurred_at: @run.occurred_at,
        time: @run.time
      }
    end

    assert_redirected_to run_path(assigns(:run))
  end

  test "should show run" do
    get :show, id: @run
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @run
    assert_response :success
  end

  test "should update run" do
    patch :update, id: @run, run: {
      distance: @run.distance,
      occurred_at: @run.occurred_at,
      time: @run.time
    }
    assert_redirected_to run_path(assigns(:run))
  end

  test "should destroy run" do
    assert_difference("Run.count", -1) do
      delete :destroy, id: @run
    end

    assert_redirected_to runs_path
  end
end
