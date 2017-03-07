class RunsController < ApplicationController
  before_action :authorize


  def create
    new_run = current_user.runs.new(time_handler)

    if new_run.save
      render json: {status: 202, message: "Run created"}
    else
      render json: {status: 422, error: new_run.errors}
    end
  end

  def index
    render json: { status: 200, runs: current_user.runs }
  end

  def update
    run = current_user.runs.find(params[:id])

    run.update(time_handler)

    render json: { status: 200, runs: current_user.runs }

  end

  private

  def time_handler
    secs = run_params[:end_time].to_time - run_params[:beginning_time].to_time

    {
      mileage: run_params[:mileage],
      beginning_time: run_params[:beginning_time],
      end_time: run_params[:end_time],
      duration_in_secs: secs
      }
  end

  def run_params
    params.require(:run).permit(:mileage, :beginning_time, :end_time)
  end
end
