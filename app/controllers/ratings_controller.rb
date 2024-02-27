class RatingsController < ApplicationController
    skip_before_action :require_login, only: [:show, :index] # skip require_login for show and index actions
    before_action :set_jelly_cat
    before_action :set_rating, only: [:show, :edit, :update, :destroy]
    
    def index
        @jelly_cat = JellyCat.find(params[:jelly_cat_id])
        @ratings = @jelly_cat.ratings
      end

    def show
    end
  
    # render form to create new record
    def new
      @rating = @jelly_cat.ratings.build
    end
  
    # process 'new' form submission to create record in database
    def create
      @rating = @jelly_cat.ratings.build(rating_params)
      if @rating.save
        redirect_to jelly_cat_path(@jelly_cat), notice: 'Successfully rated JellyCat'
      else
        render :new
      end
    end
  
    # render form to edit record
    def edit
    end
  
    # process 'edit' form submission to update record in database
    def update
      if @rating.update(rating_params)
        redirect_to jelly_cat_path(@jelly_cat), notice: 'Rating was successfully updated'
      else
        render :edit
      end
    end
  
    def destroy
      @rating.destroy
      redirect_to jelly_cat_path(@jelly_cat), notice: 'Delete operation was successful'
    end
  
    private
  
    # set instance of Rating 
    def set_rating
      @rating = Rating.find(params[:id])
    end
  
    # set instance of JellyCat
    def set_jelly_cat
      @jelly_cat = JellyCat.find(params[:jelly_cat_id])
    end
  
    def rating_params
      params.require(:rating).permit(:rating, :reviewer_name, :review_text, :jelly_cat_id)
    end
  end
  