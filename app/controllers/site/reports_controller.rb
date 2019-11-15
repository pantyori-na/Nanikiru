class Site::ReportsController < Site::Base
  before_action :set_report, only: [:show, :edit, :update, :destroy]

  def index
    @reports = Report.all
  end

  def show
    @report = Report.find(params[:id])
  end

  def new
    @report = Report.new
  end

  def create
    @report = Report.new(report_params)
    @report.user_id = User.find(params[:user_id]).id
    #respond_to do |format|
      if @report.save
        redirect_to report_path(@report)
        # format.html { render user_report_path(@report.user_id,@report.id), notice: 'Report was successfully created.' }
      else
        redirect_back(fallback_location: root_path)
      end
    #end
  end

  def destroy
    @report.destroy
    respond_to do |format|
      format.html { redirect_to reports_url, notice: 'Report was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_report
      @report = Report.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def report_params
      params.require(:report).permit(:user_id, :comment, :report_type)
    end
end
