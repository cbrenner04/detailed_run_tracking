# frozen_string_literal: true
require "test_helper"
require "devise"

# runs controller test
class RunsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

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

  test "should not create run" do
    assert_no_difference("Run.count") do
      post :create, user_id: @user.id, run: {
        distance_attributes: { unit: "mi", length: 1 },
        duration_attributes: { hours: 1, minutes: 1, seconds: 1 }
      }
    end
  end

  test "should create run" do
    assert_difference("Run.count") do
      post :create, user_id: @user.id, run: {
        occurred_at: @run.occurred_at,
        distance_attributes: { unit: "mi", length: 1 },
        duration_attributes: { hours: 1, minutes: 1, seconds: 1 }
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

  test "should not update run" do
    patch :update, user_id: @user.id, id: @run, run: {
      occurred_at: @run.occurred_at,
      distance_attributes: nil,
      duration_attributes: { hours: 1, minutes: 1, seconds: 1 }
    }
    assert_not_nil @run.distance
    assert_not @run.duration == 3661
  end

  test "should update run" do
    patch :update, user_id: @user.id, id: @run, run: {
      occurred_at: @run.occurred_at,
      distance_attributes: { unit: "mi", length: 1 },
      duration_attributes: { hours: 1, minutes: 1, seconds: 1 }
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
