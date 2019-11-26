class Site::AnswersController < Site::Base
  before_action :set_answer, only: [:show, :edit, :update, :destroy]

  def index
    @answers = Answer.all
  end



  def show
    @answer = Answer.find(params[:id])
    @post_image = PostImage.find(params[:post_image_id])
    @post_comment = PostComment.new
    @selections = @post_image.selections
  end

  def new
  end

  def edit
  end

  def create
     @post_image = PostImage.find(params[:post_image_id])
     # 重複した選択肢を削除する
     current_user.same_answer_destroy
    # 回答済みのNanikiruかどうか
    if @post_image.answered?(current_user)
      # 回答済みのユーザーは回答出来ずに結果画面にリダイレクトする
        if answered_id = @post_image.answered_id(current_user)
          flash[:danger] = '回答済みのNanikiruです！！'
          redirect_to post_image_answer_path(@post_image.id,answered_id)
        else
          flash[:danger] = '[Error!]回答に問題があります'
          redirect_to root_path
        end
      else
      # 回答済みのではない場合save
      @answer = Answer.new(answer_params)
      @answer.user_id = current_user.id
      respond_to do |format|
        if @answer.save
          format.html { redirect_to post_image_answer_path(params[:post_image_id],@answer.id), notice: 'Answer was successfully created.' }
        else
          format.html { render :new }
        end
      end
    end
  end

  def update
    respond_to do |format|
      if @answer.update(answer_params)
        format.html { redirect_to @answer, notice: 'Answer was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @answer.destroy
    respond_to do |format|
      format.html { redirect_to answers_url, notice: 'Answer was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @answer = Answer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def answer_params
      params.require(:answer).permit(:user_id, :selection_id)
    end
end
