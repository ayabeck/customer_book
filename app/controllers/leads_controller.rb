class LeadsController < ApplicationController
  before_action :set_lead, only: [:show, :edit, :update, :destroy]

  # GET /leads
  # GET /leads.json
  def index
    respond_to do |format|
      format.html do
        @leads = Lead.page(params[:page])
      end
      format.csv do
        @leads = Lead.all
        send_data(render_to_string, filename: filename_of(Lead, 'csv'), type: 'text/csv')
      end
    end
  end

  # GET /leads/1
  # GET /leads/1.json
  def show
    @contacts = @lead.contacts
  end

  # GET /leads/new
  def new
    @lead = Lead.new
  end

  # GET /leads/1/edit
  def edit
  end

  # POST /leads
  # POST /leads.json
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

  # GET /events/1/leads/export
  def export
    @leads = Lead.where(event_id: params[:event_id])
    send_data(render_to_string, filename: filename_of(Lead, 'csv'), type: 'text/csv')
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lead
      @lead = Lead.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lead_params
      params.require(:lead).permit(:company_name, :department, :title, :name, :email, :phone, :date_on, :trigger, :memo, :event_id)
    end
end
