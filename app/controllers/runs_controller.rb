# frozen_string_literal: true
class RunsController < ApplicationController
  before_action :set_run, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET user/:user_id/runs
  # GET user/:user_id/runs.json
  def index
    @user = User.find(params[:user_id] || current_user.id)
    @runs = @user.runs

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @runs }
    end
  end

  # GET user/:user_id/runs/1
  # GET user/:user_id/runs/1.json
  def show
    @run = user.runs.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @runs }
    end
  end

  # GET user/:user_id/runs/new
  def new
    @run = user.runs.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @runs }
    end
  end

  # GET user/:user_id/runs/1/edit
  def edit
    @run = user.runs.find(params[:id])
  end

  # POST user/:user_id/runs
  # POST user/:user_id/runs.json
  def create
    @run = user.runs.new(run_params)

    respond_to do |format|
      if @run.save
        format.html { redirect_to [@run.user, @run], notice: "Run was successfully created." }
        format.json { render :show, status: :created, location: @run }
      else
        format.html { render :new, alert: "There was a problem saving the run." }
        format.json { render json: @run.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT user/:user_id/runs/1
  # PATCH/PUT user/:user_id/runs/1.json
  def update
    @run = user.runs.find(params[:id])

    respond_to do |format|
      if @run.update(run_params)
        format.html { redirect_to [@run.user, @run], notice: "Run was successfully updated." }
        format.json { render :show, status: :ok, location: @run }
      else
        format.html { render :edit, alert: "There was a problem updating the run." }
        format.json { render json: @run.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE user/:user_id/runs/1
  # DELETE user/:user_id/runs/1.json
  def destroy
    @run = user.runs.find(params[:id])

    @run.destroy
    respond_to do |format|
      format.html { redirect_to user_runs_url, notice: "Run was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_run
    @run = Run.find(params[:id])
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
