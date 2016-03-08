class UsersController < ApplicationController
    def index
    end
    def userpage
        if session[:username].nil?
            redirect_to login_path
        end
        @username = session[:username]
    end
    def newclass
        @days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday']
    end
    def classadded
        if session[:username].nil?
            redirect_to login_path
        end
        @days = params[:days].keys
        redirect_to userpage_path
    end
end
