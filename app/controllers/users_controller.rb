class UsersController < ApplicationController
    def index
    end
    def userpage
        if params[:notice] == "Course Deleted"
            flash[:notice] = "Course Deleted"
        end
        if session[:username].nil?
            redirect_to login_path
        end
        @username = session[:username]
    end
end
