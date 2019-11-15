class Site::GameRecordsController < Site::Base
  before_action :set_game_record, only: [:show, :edit, :update, :destroy]
  def new
    @game_record = GameRecord.new
  end

  def edit
  end

  def create
    @game_record = GameRecord.new(game_record_params)
    @game_record.user_id = current_user.id
    respond_to do |format|
      if @game_record.save
        format.html { redirect_to user_path(current_user), notice: 'Game record was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @game_record.update(game_record_params)
        format.html { redirect_to user_path(current_user), notice: 'Game record was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @game_record.destroy
    respond_to do |format|
      format.html { redirect_to user_path(@game_record.user_id), notice: 'Game record was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game_record
      @game_record = GameRecord.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_record_params
      params.require(:game_record).permit(:user_id, :handle_name, :game_type, :ability, :game_name)
    end
end
