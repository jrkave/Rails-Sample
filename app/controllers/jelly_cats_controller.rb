class JellyCatsController < ApplicationController
    skip_before_action :require_login, only: [:show, :index] # skip require_login for show and index actions
    before_action :set_jelly_cat, only: [:show, :edit, :update, :destroy]

    def index
        @jelly_cats = JellyCat.all
    end

    def show
    end

    # render form to create new record
    def new
        @jelly_cat = JellyCat.new
    end

    # process 'new' form submission to create record in database
    def create
        @jelly_cat = JellyCat.new(jelly_cat_params)
        if @jelly_cat.save
            redirect_to @jelly_cat, notice: 'Create operation was successful'
        else
            render :new
        end
    end

    # render form to edit record
    def edit
    end

    # process 'edit' form submission to update record in database
    def update
        if @jelly_cat.update(jelly_cat_params)
            redirect_to @jelly_cat, notice: 'Update operation was successful'
        end
    end

    def destroy
        @jelly_cat.destroy
        redirect_to jelly_cats_path, notice: 'Delete operation was successful'
    end

    private 

    # Set instance of JellyCat 
    def set_jelly_cat
        @jelly_cat = JellyCat.find(params[:id])
    end

    def jelly_cat_params
        params.require(:jelly_cat).permit(:name, :description, :color, :size, :limited_edition, :year)
    end

end
