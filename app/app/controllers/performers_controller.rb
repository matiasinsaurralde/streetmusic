class PerformersController < ApplicationController
    def index
    end

    def create
        # render text: params[:performer].inspect
        @performer = Performer.new(performer_params)
        if @performer.save
            session[:performer_id] = @performer.id
            redirect_to ""
        else
            redirect_to ""
        end
    end

    def new
        @performer = Performer.new
    end

    def show
        if session[:performer_id]
            @performer = Performer.find(session[:performer_id])
        else
            @performer = Performer.find(params[:format])
        end

    end

    def edit
        # an artist can edit his profile
    end

    def destroy
        @performer = Performer.find(params[:id])
        @performer.destroy

        redirect_to ""
    end

    def lookup
        listener_position = params[:position]
        @performers = Performer.all

        render :json => Performer.all.map { |p| { 'id' => p.id, 'name' => p.name, 'position' => p.position } }
        # you need to POST to /lookup with param 'position', this param will be the value of navigator.geolocation.getCurrentPosition
    end

    def search
        listener_position = params[:position]
        @performers = Performer.all
        # you need to POST to /lookup with param 'position', this param will be the value of navigator.geolocation.getCurrentPosition
    end

    private
        def performer_params
            params.require(:performer).permit(:name, :email, :password, :password_confirmation)
        end
end
