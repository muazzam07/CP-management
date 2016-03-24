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
        if session[:username].nil?
            redirect_to login_path
        end
        @days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday']
    end
    def classadded
        if session[:username].nil?
            redirect_to login_path
        end
        @username = session[:username].to_s
        @days = params[:days].keys
        @code = params[:class][:coursenum].to_s
        @stime1 = params[:class]["time1(4i)"].to_s
        @stime2 = params[:class]["time1(5i)"].to_s
        @etime1 = params[:class]["time2(4i)"].to_s
        @etime2 = params[:class]["time2(5i)"].to_s
        @venue = params[:class][:venue].to_s
        
        @start = @stime1 + ':' + @stime2
        @end = @etime1 + ':' + @etime2
        @start.to_time
        @end.to_time
        
        @alldays = ""
        for day in @days
            @alldays = @alldays + day + ' '
        end
        
        Course.create!(:code => @code, :instructor => @username, :stime => @start, :etime => @end, :days => @alldays, :venue => @venue)
        redirect_to userpage_path
    end
    
    def manageCourse
        @username = session[:username]
        if session[:username].nil?
            redirect_to login_path
        end
        @courses = Course.where(instructor: @username).all
        @names = []
        @courses.each do |elt|
            @names.push(elt.code)
        end
    end
    
    def coursePage
        @username = session[:username]
        @courseSelect = params[:param_name]
        if not @courseSelect
            redirect_to manageCourse_path       
        else
            if session[:username].nil?
                redirect_to login_path
            end
            @course = Course.find_by_code(@courseSelect)
            @stime = @course.stime.to_s.split(' ')[1]
            @etime = @course.etime.to_s.split(' ')[1]
        end
        
    end
    
    def delCourse
        @course_code = params[:code]
        @course = Course.find_by_code(@course_code)
        @course.delete
        redirect_to userpage_path
    end



end
