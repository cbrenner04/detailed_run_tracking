# frozen_string_literal: true
require "test_helper"

# users controller test
class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
    sign_in users(:two)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference("User.count") do
      post :create, user: {
        birth_date: Time.zone.today - 20.years,
        email: "fake@example.com",
        first_name: "First",
        height: 72,
        last_name: "Last",
        password: SecureRandom.hex(10),
        weight: 150
      }
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "should show user" do
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    patch :update, id: @user, user: {
      birth_date: Time.zone.today - 21.years,
      email: "whatever@example.com",
      first_name: "First",
      height: 60,
      last_name: "Last",
      password: SecureRandom.hex(10),
      weight: 160
    }
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    assert_difference("User.count", -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end
