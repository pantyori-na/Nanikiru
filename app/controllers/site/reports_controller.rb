class Site::ReportsController < ApplicationController
  before_action :set_site_report, only: [:show, :edit, :update, :destroy]

  # GET /site/reports
  # GET /site/reports.json
  def index
    @site_reports = Site::Report.all
  end

  # GET /site/reports/1
  # GET /site/reports/1.json
  def show
  end

  # GET /site/reports/new
  def new
    @site_report = Site::Report.new
  end

  # GET /site/reports/1/edit
  def edit
  end

  # POST /site/reports
  # POST /site/reports.json
  def create
    @site_report = Site::Report.new(site_report_params)

    respond_to do |format|
      if @site_report.save
        format.html { redirect_to @site_report, notice: 'Report was successfully created.' }
        format.json { render :show, status: :created, location: @site_report }
      else
        format.html { render :new }
        format.json { render json: @site_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /site/reports/1
  # PATCH/PUT /site/reports/1.json
  def update
    respond_to do |format|
      if @site_report.update(site_report_params)
        format.html { redirect_to @site_report, notice: 'Report was successfully updated.' }
        format.json { render :show, status: :ok, location: @site_report }
      else
        format.html { render :edit }
        format.json { render json: @site_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /site/reports/1
  # DELETE /site/reports/1.json
  def destroy
    @site_report.destroy
    respond_to do |format|
      format.html { redirect_to site_reports_url, notice: 'Report was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_site_report
      @site_report = Site::Report.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def site_report_params
      params.require(:site_report).permit(:comment, :type)
    end
end
