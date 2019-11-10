class Site::GameRecordsController < Site::Base
  before_action :set_game_record, only: [:show, :edit, :update, :destroy]
  def new
    @game_record = GameRecord.new
  end

  def edit
  end

  def create
    @game_record = GameRecord.new(game_record_params)

    respond_to do |format|
      if @game_record.save
        format.html { redirect_to @game_record, notice: 'Game record was successfully created.' }
        format.json { render :show, status: :created, location: @game_record }
      else
        format.html { render :new }
        format.json { render json: @game_record.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @game_record.update(game_record_params)
        format.html { redirect_to @game_record, notice: 'Game record was successfully updated.' }
        format.json { render :show, status: :ok, location: @game_record }
      else
        format.html { render :edit }
        format.json { render json: @game_record.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @game_record.destroy
    respond_to do |format|
      format.html { redirect_to game_records_url, notice: 'Game record was successfully destroyed.' }
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
      params.require(:game_record).permit(:user_id, :handle_name, :type, :ability, :game_name)
    end
end
