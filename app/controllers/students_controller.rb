class StudentsController < ApplicationController

    before_action :find_student, only: [:show, :edit, :update]    

    def show
    end

    def new
        # must initialize this so it can be used in form_for
        @student = Student.new
    end

    def create
        @student = Student.create(stu_params)
        if @student.valid?
            redirect_to student_path(@student)
        else
            render :new
        end
    end

    def edit
    end

    def update
        @student.update(stu_params)
        redirect_to student_path(@student)
    end

    private

    def find_student
        @student = Student.find_by(id: params[:id])
    end

    def stu_params
        params.require(:student).permit(:first_name, :last_name)
    end
end