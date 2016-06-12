# frozen_string_literal: true
class RunsController < ApplicationController
  before_action :set_run, only: [:show, :edit, :update, :destroy]

  # GET /runs
  # GET /runs.json
  def index
    @runs = Run.all
  end

  # GET /runs/1
  # GET /runs/1.json
  def show
  end

  # GET /runs/new
  def new
    @run = Run.new
  end

  # GET /runs/1/edit
  def edit
  end

  # POST /runs
  # POST /runs.json
  def create
    @run = Run.new(run_params)

    respond_to do |format|
      if @run.save
        flash[:success] = "Run was successfully created."
        format.html { redirect_to @run }
        format.json { render :show, status: :created, location: @run }
      else
        flash[:danger] = "There was a problem saving the run."
        format.html { render :new }
        format.json { render json: @run.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /runs/1
  # PATCH/PUT /runs/1.json
  def update
    respond_to do |format|
      if @run.update(run_params)
        flash[:success] = "Run was successfully updated."
        format.html { redirect_to @run }
        format.json { render :show, status: :ok, location: @run }
      else
        flash[:danger] = "There was a problem updating the run."
        format.html { render :edit }
        format.json { render json: @run.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /runs/1
  # DELETE /runs/1.json
  def destroy
    @run.destroy
    respond_to do |format|
      flash[:success] = "Run was successfully destroyed."
      format.html { redirect_to runs_url }
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
    params.require(:run).permit(:occurred_at, :distance, :time)
  end
end
