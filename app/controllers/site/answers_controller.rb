class Site::AnswersController < Site::Base
  before_action :set_answer, only: [:show, :edit, :update, :destroy]

  def index
    @answers = Answer.all
  end

  def selected
  end
  def show
  end

  def new
    @answer = Answer.new
  end

  def edit
  end

  def create
    @answer = Answer.new(answer_params)
    @answer.user_id = current_user.id
    binding.pry
    respond_to do |format|
      if @answer.save
        format.html { redirect_to @answer, notice: 'Answer was successfully created.' }
      else
        format.html { render :new }
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
      params.require(:answer).permit(:user_id, :selection_id, :comment)
    end
end
