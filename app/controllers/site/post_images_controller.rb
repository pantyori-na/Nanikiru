class Site::PostImagesController < Site::Base
  before_action :set_post_image, only: [:show, :edit, :update, :destroy]

  def index
    @post_images = PostImage.all
  end

  def show
  end

  def new
    @post_image = PostImage.new
  end

  # GET /post_images/1/edit
  def edit
  end

  # POST /post_images
  # POST /post_images.json
  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id

    respond_to do |format|
      if @post_image.save
        format.html { redirect_to @post_image, notice: 'Post image was successfully created.' }
        format.json { render :show, status: :created, location: @post_image }
      else
        format.html { render :new }
        format.json { render json: @post_image.errors, status: :unprocessable_entity }
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
      params.require(:post_image).permit(:user_id, :image_type, :image, :comment)
    end
end
