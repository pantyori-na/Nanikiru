class Site::PostCommentsController < Site::Base
  def create
    @post_comment = PostComment.new(post_comment_params)
    respond_to do |format|
      if @post_comment.save
        binding.pry
        format.html { redirect_to post_image_answer_path(params[:post_image_id],@answer.id), notice: 'Answer was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end
  def destroy
  end
  def new
  end
  private
  def post_comment_params
    params.require(:post_comment).permit(:ansewr_id, :comment)
  end
end