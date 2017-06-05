# frozen_string_literal: true
class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /users
  def index
    @users = UsersPresenter.from(User.all)
  end

  # GET /users/1
  def show
    @user = UsersPresenter.new(current_user)
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit; end

  # POST /users
  def create
    @user = User.new(user_params)

    respond_to do |format|
      response = if @user.save
                   redirect_to @user, notice: "User was successfully created."
                 else
                   render :new, alert: "There was a problem saving the user."
                 end

      format.html { response }
    end
  end

  # PATCH/PUT /users/1
  def update
    respond_to do |format|
      response = if @user.update(user_params)
                   redirect_to @user, notice: "User was successfully updated."
                 else
                   render :edit, alert: "There was a problem updating the user."
                 end

      format.html { response }
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    respond_to do |format|
      format.html do
        redirect_to users_url, notice: "User was successfully destroyed."
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white
  # list through.
  def user_params
    params.require(:user).permit(
      :email,
      :password,
      :first_name,
      :last_name,
      :birth_date,
      :height,
      :weight,
      :time_zone
    )
  end
end
