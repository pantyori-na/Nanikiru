class Site::PostImagesController < Site::Base
  before_action :set_post_image, only: [:show, :edit, :update, :destroy]

  def index
    @post_images = PostImage.all
  end

  def show
    @answer = Answer.new
  end

  def new
    @post_image = PostImage.new
    @post_image.selections.build
  end

  # GET /post_images/1/edit
  def edit
  end

  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    @post_image.save
    Selection.all.each do |selection|
      selection.destroy
    end
    # @post_image.selections.each do |select|
    #   if select.name == "select"
    #      #Selection.find_by(name: "select").destroy
    #   end
    # end
    respond_to do |format|
      if @post_image.save
        format.html { redirect_to @post_image, notice: 'Post image was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /post_images/1
  # PATCH/PUT /post_images/1.json
  def update
    respond_to do |format|
      if @post_image.update(post_image_params)
        format.html { redirect_to @post_image, notice: 'Post image was successfully updated.' }
        format.json { render :show, status: :ok, location: @post_image }
      else
        format.html { render :edit }
        format.json { render json: @post_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /post_images/1
  # DELETE /post_images/1.json
  def destroy
    @post_image.destroy
    respond_to do |format|
      format.html { redirect_to post_images_url, notice: 'Post image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post_image
      @post_image = PostImage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_image_params
      params.require(:post_image).permit(:user_id, :image_type, :image, :comment, selections_attributes: [:id, :name, :_destroy])
    end
end
