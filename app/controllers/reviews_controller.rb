class ReviewsController < ApplicationController
  def create
    @list = List.find(params[:list_id])
    @review = Review.new(review_params)
    @review.list = @list
  
    if @review.save
      redirect_to list_path(@list), notice: 'Review was successfully created.'
    else
      # On suppose que vous affichez le formulaire de review dans la show de list
      # Donc on redirige vers la show avec les erreurs
      render 'lists/show', status: :unprocessable_entity
    end
  end
  
  def destroy
    @review = Review.find(params[:id])
    @list = @review.list
    @review.destroy
    redirect_to list_path(@list), notice: 'Review was successfully deleted.', status: :see_other
  end
  
  private
  
  def review_params
    params.require(:review).permit(:content)
  end
end
