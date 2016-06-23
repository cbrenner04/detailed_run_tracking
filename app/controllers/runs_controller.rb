# frozen_string_literal: true
class RunsController < ApplicationController
  before_action :set_run, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET user/:user_id/runs
  def index
    @user = User.find(params[:user_id] || current_user.id)
    @runs = @user.runs
  end

  # GET user/:user_id/runs/1
  def show
  end

  # GET user/:user_id/runs/new
  def new
    @run = user.runs.new
  end

  # GET user/:user_id/runs/1/edit
  def edit
  end

  # POST user/:user_id/runs
  def create
    @run = user.runs.new(run_params)

    respond_to do |format|
      thing = if @run.save
                redirect_to [@run.user, @run], notice: "Run was successfully created."
              else
                render :new, alert: "There was a problem saving the run."
              end

      format.html { thing }
    end
  end

  # PATCH/PUT user/:user_id/runs/1
  def update
    respond_to do |format|
      thing = if @run.update(run_params)
                redirect_to [@run.user, @run], notice: "Run was successfully updated."
              else
                render :edit, alert: "There was a problem updating the run."
              end

      format.html { thing }
    end
  end

  # DELETE user/:user_id/runs/1
  def destroy
    @run.destroy
    respond_to do |format|
      format.html { redirect_to user_runs_url, notice: "Run was successfully destroyed." }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_run
    @run = user.runs.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white-
  # list through.
  def run_params
    params.require(:run).permit(
      :occurred_at, :type_of_workout, :environment, :surface,
      :how_it_went, :last_meal, :time_of_last_meal,
      distance_attributes: [:unit, :length],
      duration_attributes: [:hours, :minutes, :seconds],
      temperature_attributes: [:value, :unit]
    )
  end

  def user
    User.find(params[:user_id])
  end
end
