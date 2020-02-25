class SchoolClassesController < ApplicationController
    before_action :find_schoolclass, only: [:show, :edit, :update]    

    def show
    end

    def new
        # must initialize this so it can be used in form_for
        @school_class = SchoolClass.new
    end

    def create
        @school_class = SchoolClass.create(school_params)
        if @school_class.valid?
            redirect_to school_class_path(@school_class)
        else
            render :new
        end
    end

    def edit
    end

    def update
        @school_class.update(school_params)
        redirect_to school_class_path(@school_class)
    end

    private

    def school_params
        params.require(:school_class).permit(:title, :room_number)
    end

    def find_schoolclass
        @school_class = SchoolClass.find_by(id: params[:id])
    end
end