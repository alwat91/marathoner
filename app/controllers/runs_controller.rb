class RunsController < ApplicationController
  before_action :authorize

  def create
    new_run = current_user.runs.new(run_params)

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
