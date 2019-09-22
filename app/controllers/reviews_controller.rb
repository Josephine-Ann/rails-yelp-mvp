class ReviewsController < ApplicationController
  def index
    @reviews = Reviews.all
  end

  def show
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(restaurant_params)
      if @review.save
        redirect_to review_path(@review)
      else
        render :new
    end
  end

  def edit
  end

  def destroy
  end

  def update
  end
end
