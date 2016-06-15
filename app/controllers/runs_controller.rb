# frozen_string_literal: true
class RunsController < ApplicationController
  before_action :set_run, only: [:show, :edit, :update, :destroy]

  # GET user/:user_id/runs
  # GET user/:user_id/runs.json
  def index
    user = User.find(params[:user_id])
    @runs = user.runs

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @runs }
    end
  end

  # GET user/:user_id/runs/1
  # GET user/:user_id/runs/1.json
  def show
    user = User.find(params[:user_id])
    @run = user.runs.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @runs }
    end
  end

  # GET user/:user_id/runs/new
  def new
    user = User.find(params[:user_id])
    @run = user.runs.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @runs }
    end
  end

  # GET user/:user_id/runs/1/edit
  def edit
    user = User.find(params[:user_id])
    @run = user.runs.find(params[:id])
  end

  # POST user/:user_id/runs
  # POST user/:user_id/runs.json
  def create
    user = User.find(params[:user_id])
    @run = user.runs.new(run_params)

    respond_to do |format|
      if @run.save
        flash[:success] = "Run was successfully created."
        format.html { redirect_to [@run.user, @run] }
        format.json { render :show, status: :created, location: @run }
      else
        flash[:danger] = "There was a problem saving the run."
        format.html { render :new }
        format.json { render json: @run.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT user/:user_id/runs/1
  # PATCH/PUT user/:user_id/runs/1.json
  def update
    user = User.find(params[:user_id])
    @run = user.runs.find(params[:id])
    respond_to do |format|
      if @run.update(run_params)
        flash[:success] = "Run was successfully updated."
        format.html { redirect_to [@run.user, @run] }
        format.json { render :show, status: :ok, location: @run }
      else
        flash[:danger] = "There was a problem updating the run."
        format.html { render :edit }
        format.json { render json: @run.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE user/:user_id/runs/1
  # DELETE user/:user_id/runs/1.json
  def destroy
    user = User.find(params[:user_id])
    @run = user.runs.find(params[:id])
    @run.destroy
    respond_to do |format|
      flash[:success] = "Run was successfully destroyed."
      format.html { redirect_to user_runs_url }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_run
    @run = Run.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white
  # list through.
  def run_params
    params.require(:run).permit(:occurred_at, :distance, :time,
                                :duration_hours, :duration_minutes,
                                :duration_seconds)
  end
end
