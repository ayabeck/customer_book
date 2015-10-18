class LeadsController < ApplicationController
  include CsvHelper

  before_action :set_event, only: [:index, :new, :create, :new_import, :import]
  before_action :set_lead, only: [:show, :edit, :update, :destroy]
  before_action :set_back_url, only: [:new, :create, :new_import, :import]

  # GET /leads
  # GET /leads.csv
  # GET /events/1/leads.csv
  def index
    respond_to do |format|
      @leads = @event ? @event.leads : Lead.all
      format.html
      format.csv  { SendCSV.new(@leads, self, @event) }
    end
  end

  # GET /leads/1
  # GET /leads/1.json
  def show
    @contacts = @lead.contacts
    @events = @lead.events
  end

  # GET /leads/new
  # GET /events/1/leads/new
  def new
    @lead = Lead.new(date_on: Time.zone.today)
    @lead.event_ids = @event.id if @event
  end

  # GET /leads/1/edit
  def edit
  end

  # POST /leads
  # POST /leads.json
  # POST /events/1/leads
  def create
    @lead = Lead.new(lead_params)

    respond_to do |format|
      if @lead.save
        flash[:notice] = success_message(controller_name, action_name)
        format.html { redirect_to @lead }
        format.json { render :show, status: :created, location: @lead }
      else
        format.html { render :new }
        format.json { render json: @lead.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /leads/1
  # PATCH/PUT /leads/1.json
  def update
    respond_to do |format|
      if @lead.update(lead_params)
        flash[:notice] = success_message(controller_name, action_name)
        format.html { redirect_to @lead }
        format.json { render :show, status: :ok, location: @lead }
      else
        format.html { render :edit }
        format.json { render json: @lead.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leads/1
  # DELETE /leads/1.json
  def destroy
    @lead.destroy
    respond_to do |format|
      flash[:notice] = success_message(controller_name, action_name)
      format.html { redirect_to leads_url }
      format.json { head :no_content }
    end
  end

  # GET /leads/new_import
  def new_import
    @data_import = DataImport.new
  end

  # POST /leads/import
  def import
    @data_import = DataImport.new(params[:data_import])
    @data_import.init(Lead, @event)
    if @data_import.save
      flash[:notice] = success_message(controller_name, action_name)
      redirect_to @back_url
    else
      render :new_import
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:event_id]) if params[:event_id]
    end
    def set_lead
      @lead = Lead.find(params[:id])
    end
    def set_back_url
      @back_url = @event || leads_url
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lead_params
      params.require(:lead).permit(
          :company_name, :department, :title, :name, :email, :phone, :date_on, :trigger, :memo, event_ids: [])
    end
end
