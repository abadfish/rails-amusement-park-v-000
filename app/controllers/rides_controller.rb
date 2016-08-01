class RidesController < ApplicationController

  def create
    @ride = Ride.new(ride_params.merge(user: current_user))
    if @ride.save
       redirect_to user_path(@ride.user), :notice => @ride.take_ride
    else
      redirect_to attractions_path
    end
  end

  private

  def ride_params
    params.require(:ride).permit(:attraction_id)
  end
end
