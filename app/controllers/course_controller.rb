class CourseController < ApplicationController
    def new
        if session[:username].nil?
            redirect_to login_path
        end
        @ntce = params[:ntce]
        if @ntce == '1'
            flash[:notice] = 'Incomplete Details Provided.'
        end
        @days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday']
        @editStatus = params[:editStatus]
        @code = params[:course_id]
    end
    
    def courseadd
        if session[:username].nil?
            redirect_to login_path
        end
        @username = session[:username].to_s
        @days = params[:days]
        if @days
            @days = @days.keys
        end
        @code = params[:course][:coursecode].to_s
        @stime1 = params[:course]["time1(4i)"].to_s
        @stime2 = params[:course]["time1(5i)"].to_s
        @etime1 = params[:course]["time2(4i)"].to_s
        @etime2 = params[:course]["time2(5i)"].to_s
        @venue = params[:course][:venue].to_s
        
        @start = @stime1 + ':' + @stime2
        @end = @etime1 + ':' + @etime2
        @start.to_time
        @end.to_time
        
        @alldays = ""
        if @days
            for day in @days
                @alldays = @alldays + day + ' '
            end
        end
        
        @editStatus = params[:editStatus]
        @id = params[:course_id]
        if @editStatus == 'True'
            @c = Course.find_by_code(@id)
            if @code != ''
                @c.code = @code
            elsif @days 
                @c.days = @alldays
            elsif @venue != ''
                @c.venue = @venue
            elsif @start.to_s != '00:00'
                @c.stime = @start
            elsif @end.to_s != '00:00'
                @c.etime = @end
            end
            @c.save!
        else
            if @code == '' or not @days or @venue == '' or @start.to_s == '00:00' or @end.to_s == '00:00'
                redirect_to users_course_new_path(:ntce => '1')
                return
            else
                Course.create!(:code => @code, :instructor => @username, :stime => @start, :etime => @end, :days => @alldays, :venue => @venue)
            end
        end
        flash[:notice] = "Course Added"
        redirect_to userpage_path
    end
    
    def managecourse
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
    
    def coursepage
        @username = session[:username]
        @courseSelect = params[:param_name]
        if not @courseSelect
            redirect_to users_course_managecourse_path       
        else
            if session[:username].nil?
                redirect_to login_path
            end
            @course = Course.find_by_code(@courseSelect)
            @stime = @course.stime.to_s.split(' ')[1]
            @etime = @course.etime.to_s.split(' ')[1]
        end
    end
    
    def delcourse
        if session[:username].nil?
            redirect_to login_path
        end
        @course_code = params[:course_id]
        @course = Course.find_by_code(@course_code)
        @course.delete
        redirect_to userpage_path(:notice => 'Course Deleted')
    end
    
    def seatingplan
        if session[:username].nil?
            redirect_to login_path
        end
        @code = params[:course_id]
        @course = Course.find_by_code(@code)
        @students = []
        
    end
    
    def seatingplanadd
        redirect_to userpage_path
    end
    
    def manageseatingplan
        if session[:username].nil?
            redirect_to login_path
        end
    end
    
    def editseatingplan
        if session[:username].nil?
            redirect_to login_path
        end
        @code = params[:course_id]
    end
    
    def editcomplete
        if session[:username].nil?
            redirect_to login_path
        end
        @code = params[:course_id]
    end
    
    def delseatingplan
        if session[:username].nil?
            redirect_to login_path
        end
        @code = params[:course_id]
    end
    
    def markclass
        if session[:username].nil?
            redirect_to login_path
        end
        @code = params[:course_id]
    end
    
    def markcomplete
        if session[:username].nil?
            redirect_to login_path
        end
        @code = params[:course_id]
    end
end
