require 'spec_helper'

describe CourseController do
    # before :each do
    #     # @temp1 = Course.create()
    #     # @movs_not_dir = Movie.where("director != ?", "Jean-Pierre Jeunet")
    # end
    
    describe 'related to course' do
        it "should add course" do
            post :courseadd, {"course"=>{"coursecode"=>"CS10000", "time1(1i)"=>"2016", "time1(2i)"=>"5", "time1(3i)"=>"2", "time1(4i)"=>"01", "time1(5i)"=>"02", "time2(1i)"=>"2016", "time2(2i)"=>"5", "time2(3i)"=>"2", "time2(4i)"=>"02", "time2(5i)"=>"02", "venue"=>"Auditorium A-2"}, "days"=>{"Monday"=>"1", "Tuesday"=>"1"}}
            assigns(:code).should == "CS10000"
            assigns(:stime1).should == "01"
            assigns(:stime2).should == "02"
            assigns(:etime1).should == "02"
            assigns(:etime2).should == "02"
            assigns(:venue).should == "Auditorium A-2"
            assigns(:days).should == ["Monday", "Tuesday"]
        end
        
        it "should delete course" do
            # post :courseadd, {"course"=>{"coursecode"=>"CS10000", "time1(1i)"=>"2016", "time1(2i)"=>"5", "time1(3i)"=>"2", "time1(4i)"=>"01", "time1(5i)"=>"02", "time2(1i)"=>"2016", "time2(2i)"=>"5", "time2(3i)"=>"2", "time2(4i)"=>"02", "time2(5i)"=>"02", "venue"=>"Auditorium A-2"}, "days"=>{"Monday"=>"1", "Tuesday"=>"1"}}
            post :delcourse, {:course_id => "CS300"}
            # assigns(:course_code).should == "CS300"
            expect(Course.find_by_code("CS300").nil?).to eq(false)
        end
        
        it "should edit course" do
            post :courseadd, {"course"=>{"coursecode"=>"CS10000", "time1(1i)"=>"2016", "time1(2i)"=>"5", "time1(3i)"=>"2", "time1(4i)"=>"01", "time1(5i)"=>"02", "time2(1i)"=>"2016", "time2(2i)"=>"5", "time2(3i)"=>"2", "time2(4i)"=>"02", "time2(5i)"=>"02", "venue"=>"Auditorium A-2"}, "days"=>{"Monday"=>"1", "Tuesday"=>"1"}}
            assigns(:code).should == "CS10000"
            assigns(:stime1).should == "01"
            assigns(:stime2).should == "02"
            assigns(:etime1).should == "02"
            assigns(:etime2).should == "02"
            assigns(:venue).should == "Auditorium A-2"
            assigns(:days).should == ["Monday", "Tuesday"]
        end
    end
    
end