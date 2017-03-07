class RunsController < ApplicationController
  before_action :authorize

  def duration_in_secs
  run_params[:end_time].to_time - run_params[:beginning_time].to_time
  end

  def create
    new_run = current_user.runs.new({
      mileage: run_params[:mileage],
      beginning_time: run_params[:beginning_time],
      end_time: run_params[:end_time],
      duration_in_secs: duration_in_secs
      })

    if new_run.save
      render json: {status: 202, message: "Run created"}
    else
      render json: {status: 422, error: new_run.errors}
    end
  end


  def run_params
    params.require(:run).permit(:mileage, :beginning_time, :end_time)
  end
end
