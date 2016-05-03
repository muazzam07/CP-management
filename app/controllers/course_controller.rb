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
            else
                Course.create!(:code => @code, :instructor => @username, :stime => @start, :etime => @end, :days => @alldays, :venue => @venue)
            end
        end
        flash[:notice] = "Course Added"
        #----
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
            redirect_to login_path #and return
        end
            @course_code = params[:course_id]
            @course = Course.find_by_code(@course_code)
            @course.delete
            #--
            redirect_to userpage_path(:notice => 'Course Deleted') #and return
    end
    
    def seatingplan
        if session[:username].nil?
            redirect_to login_path
        end
        @code = params[:course_id]
        @course = Course.find_by_code(@code)
        if @course
            @test = @course.venue
            @student_id = params[:roll_number].to_s
            @student_seat = params[:id].to_s
            @ven = @course.venue
            if @student_id != 0
                puts @ven
                Auditorium.create!(:name => @ven, :seat => @student_seat, :roll_num => @student_id, :course => @course.code)
                Student.create!(:roll_num => @student_id, :course => @course.code, :marks => 0)
            end
        end
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
        @course = Course.find_by_code(@code)
        if @course
            @test = @course.venue
            @student = Auditorium.where(:course => @course.code).where(:name => @test)
            @e_hash = Hash.new
            @student.each do |ele|
                @e_hash[ele.seat] = ele.roll_num
            end
        end
    end
    
    def delseatingplan
        if session[:username].nil?
            redirect_to login_path
        end
        @code = params[:course_id]
        @course = Course.find_by_code(@code)
        if @course
            @student = Auditorium.where(:course => @course.code).where(:name => @course.venue)
            @student.each do |ele|
                ele.destroy
            end
        end
        redirect_to users_course_coursepage_path(:param_name => @code, :commit => "Submit")
    end
    
    def markclass
        if session[:username].nil?
            redirect_to login_path
        end
        @code = params[:course_id]
        @course = Course.find_by_code(@code)
        if @course
            @test = @course.venue
            @student = Auditorium.where(:course => @course.code).where(:name => @course.venue)
            @e_hash = Hash.new
            @student.each do |ele|
                @e_hash[ele.seat] = ele.roll_num
            end
            @student_seat = params[:id].to_s
            @roll = @e_hash[@student_seat].to_s
            @s = Student.where(:roll_num => @roll, :course => @course.code)
            puts @s.name
            #check student roll number using auditorium then check his marks and add 1
        end
    end
end
