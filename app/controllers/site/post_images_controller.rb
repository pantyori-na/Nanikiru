class Site::PostImagesController < Site::Base
  skip_before_action :authenticate_user!, only: [:index]
  before_action :set_post_image, only: [:show, :edit, :update, :destroy]
  def index
    @post_images = PostImage.page(params[:page]).reverse_order.per(9)
    @post_4p_images = PostImage.where(image_type: "player_4").page(params[:page]).reverse_order.per(9)
    @post_3p_images = PostImage.where(image_type: "player_3").page(params[:page]).reverse_order.per(9)
    @post_other_images = PostImage.where(image_type: "others").page(params[:page]).reverse_order.per(9)
  end

  def index_all
    @post_images = PostImage.page(params[:page]).reverse_order.per(12)
  end

  def index_4p
    @post_4p_images = PostImage.where(image_type: "player_4").page(params[:page]).reverse_order.per(12)
  end

  def index_3p
    @post_3p_images = PostImage.where(image_type: "player_3").page(params[:page]).reverse_order.per(12)
  end

  def index_other
    @post_other_images = PostImage.where(image_type: "others").page(params[:page]).reverse_order.per(12)
  end

  def show
    # 重複した選択肢を削除する
    current_user.same_answer_destroy
    @post_image = PostImage.find(params[:id])
    # selectの削除
    @post_image.selections.where(name: "select").destroy_all
    # 回答済みのユーザーを回答済み画面にリダイレクト
    if @post_image.answered?(current_user)
      answered_id = @post_image.answered_id(current_user)
      if answered_id
        redirect_to post_image_answer_path(@post_image.id,answered_id)
      else
        flash[:danger] = '[Error!]回答が存在しません'
        redirect_to root_path
      end
    end
    @selection = Selection.new
    @answer = Answer.new
    @report = Report.new
  end

  def new
    @post_image = PostImage.new
    @post_image.selections.build
  end

  def edit
    @report = Report.new
  end

  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    respond_to do |format|
      if @post_image.save
        format.html { redirect_to @post_image, notice: 'Post image was successfully created.' }
        else
        format.html { render :new }
      end
    end
    # 選択肢の重複の削除
    @post_image.same_selection_destroy
  end
  # user_created_nanikiruページ
  def created
    @user = User.find(params[:user_id])
    @post_images = @user.post_images
    @report = Report.new
  end
  # user_selected_nanikiru
  def selected
    @user = User.find(params[:user_id])
    @answers = @user.answers
    # 重複した選択肢を削除する
    @user.same_answer_destroy
  end

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

  def destroy
    @post_image.destroy
    respond_to do |format|
      format.html { redirect_to post_images_url, notice: 'Post image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_post_image
      @post_image = PostImage.find(params[:id])
    end

    def post_image_params
      params.require(:post_image).permit(:user_id, :image_type, :image, :comment, selections_attributes: [:id, :name, :_destroy])
    end
end
