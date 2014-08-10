class SessionsController < ApplicationController
    def new
    end

    def create
        performer = Performer.find_by_email(params[:session][:email])
        if performer && performer.authenticate(params[:session][:password])
            session[:performer_id] = performer.id
            redirect_to "", notice: "logged in"
        else
            flash.now.alert = "Email or password is invalid"
            redirect_to "/sessions/new"
        end
    end

    def destroy
        session[:performer_id] = nil
        redirect_to root_url, notice: "Logged out!"
    end
end

