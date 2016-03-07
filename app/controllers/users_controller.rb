class UsersController < ApplicationController
    def index
    end
    def userpage
        @username = params[:username]
    end
end
