class PerformersController < ApplicationController
    def index
    end

    def create
    end

    def new
    end

    def view
        # when you see an artist page
        # allows to donate
    end

    def edit
        # an artist can edit his profile
    end

    def delete
        # delete yourself from database?
    end

    def lookup
        listener_position = params[:position]
        # you need to POST to /lookup with param 'position', this param will be the value of navigator.geolocation.getCurrentPosition
    end




end
