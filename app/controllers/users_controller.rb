class UsersController < ApplicationController
    def index
    end
    def userpage
        if session[:username].nil?
            redirect_to login_path
        end
        @username = session[:username]
    end
end
