class CompaniesController < ApplicationController
  include CsvHelper

  before_action :set_company, only: [:show, :edit, :update, :destroy]

  # GET /companies
  # GET /companies.csv
  def index
    respond_to do |format|
      format.html { @companies = Company.page(params[:page]) }
      format.csv  { SendCSV.new(Company.all, self) }
    end
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
    @leads = Lead.all
    # @leads = Lead.where()
  end

  # GET /companies/new
  def new
    @company = Company.new
  end

  # GET /companies/1/edit
  def edit
  end

  # POST /companies
  # POST /companies.json
  def create
    @company = Company.new(company_params)

    respond_to do |format|
      if @company.save
        flash[:notice] = success_message(controller_name, action_name)
        format.html { redirect_to @company }
        format.json { render :show, status: :created, location: @company }
      else
        format.html { render :new }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /companies/1
  # PATCH/PUT /companies/1.json
  def update
    respond_to do |format|
      if @company.update(company_params)
        flash[:notice] = success_message(controller_name, action_name)
        format.html { redirect_to @company }
        format.json { render :show, status: :ok, location: @company }
      else
        format.html { render :edit }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    @company.destroy
    respond_to do |format|
      flash[:notice] = success_message(controller_name, action_name)
      format.html { redirect_to companies_url }
      format.json { head :no_content }
    end
  end

  # GET /companies/new_import
  def new_import
    @data_import = DataImport.new
  end

  # POST /companies/import
  def import
    @data_import = DataImport.new(params[:data_import])
    @data_import.init(Company)
    if @data_import.save
      flash[:notice] = success_message(controller_name, action_name)
      redirect_to companies_url
    else
      render :new_import
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_params
      params.require(:company).permit(:name, :business_type, :outline)
    end
end
