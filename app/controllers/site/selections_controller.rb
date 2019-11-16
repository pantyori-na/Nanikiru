class Site::SelectionsController < Site::Base
  before_action :set_selection, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @selection = Selection.new
  end

  def edit
  end

  def create
    @selection = Selection.new(selection_params)

    respond_to do |format|
      if @selection.save
        format.html { redirect_to post_image_path(@selection.post_image_id), notice: 'Selection was successfully created.' }
        format.json { render :show, status: :created, location: @selection }
      else
        format.html { render :new }
        format.json { render json: @selection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /selections/1
  # PATCH/PUT /selections/1.json
  def update
    respond_to do |format|
      if @selection.update(selection_params)
        format.html { redirect_to @selection, notice: 'Selection was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /selections/1
  # DELETE /selections/1.json
  def destroy
    @selection.destroy
    respond_to do |format|
      format.html { redirect_to selections_url, notice: 'Selection was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_selection
      @selection = Selection.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def selection_params
      params.require(:selection).permit(:post_image_id, :name)
    end
end

