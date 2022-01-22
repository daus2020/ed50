class ReviewsController < ApplicationController
  before_action :set_restaurant
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  # GET restaurants/1/reviews
  def index
    @reviews = @restaurant.reviews
  end

  # GET restaurants/1/reviews/1
  def show
  end

  # GET restaurants/1/reviews/new
  def new
    @review = @restaurant.reviews.build
  end

  # GET restaurants/1/reviews/1/edit
  def edit
  end

  # POST restaurants/1/reviews
  def create
    @review = @restaurant.reviews.build(review_params)

    if @review.save
      redirect_to([@review.restaurant, @review], notice: 'Review was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT restaurants/1/reviews/1
  def update
    if @review.update_attributes(review_params)
      redirect_to([@review.restaurant, @review], notice: 'Review was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE restaurants/1/reviews/1
  def destroy
    @review.destroy

    redirect_to restaurant_reviews_url(@restaurant)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant
      @restaurant = Restaurant.find(params[:restaurant_id])
    end

    def set_review
      @review = @restaurant.reviews.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def review_params
      params.require(:review).permit(:comment, :restaurant_id)
    end
end
