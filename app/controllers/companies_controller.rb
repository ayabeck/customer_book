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
    @leads = Lead.company_name_is(@company.name)
    @timeline_topics = @company.associated_models
  end

  # GET /companies/new
  def new
    @company = params[:q] ? Company.new(name: params[:q]) : Company.new
    session[:previous_url] = request.referer
    @back_url = session[:previous_url]
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
        @back_url = session[:previous_url]
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

  # GET /companies/search?q=hoge
  def search
    company = Company.search(params[:q])
    if company
      redirect_to company
    else
      flash[:alert] = "「#{ params[:q] }」はまだ顧客企業に登録されていません。新しく登録しませんか？"
      redirect_to new_company_url(q: params[:q])
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
