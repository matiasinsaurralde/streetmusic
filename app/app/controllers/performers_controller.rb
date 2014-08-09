class PerformersController < ApplicationController
  def index
  end
  def lookup
    listener_position = params[:position]
    render :json => Performer.all.map { |p| { 'id' => p.id, 'name' => p.name } }
    # you need to POST to /lookup with param 'position', this param will be the value of navigator.geolocation.getCurrentPosition
  end
end
