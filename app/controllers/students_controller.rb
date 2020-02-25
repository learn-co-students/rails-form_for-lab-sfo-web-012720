class StudentsController < ApplicationController
    before_action :set_student, only: [:edit, :show, :update]

    def show
    end

    def new
        @student = Student.new
    end

    def create
        @student = Student.new(student_params)
        @student.save
        redirect_to @student
    end

    def edit
    end

    def update
        @student.update(student_params)
        redirect_to @student
    end

    private

    def student_params
        params.require(:student).permit(:first_name, :last_name)
    end

    def set_student
        @student = Student.all.find_by(params[:id])
    end

end