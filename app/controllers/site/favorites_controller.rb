class Site::FavoritesController < Site::Base
  before_action :set_favorite, only: [:show, :edit, :update, :destroy]

  def create
    binding.pry
    post_image = PostImage.find(params[:post_image_id])
    favorite = current_user.favorites.new(post_image_id: post_image.id)
    #favorite = Favorite.new(favorite_params)
    favorite.user_id = current_user.id
    favorite.save
    redirect_back(fallback_location:root_path)
  end

  def destroy
    @favorite.destroy
    respond_to do |format|
      format.html { redirect_to favorites_url, notice: 'Favorite was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_favorite
      @favorite = Favorite.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def favorite_params
      params.require(:favorite).permit(:user_id, :post_image_id)
    end
end
