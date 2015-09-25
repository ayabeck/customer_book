class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    respond_to do |format|
      format.html do
        @events = Event.page(params[:page])
      end
      format.csv do
        @events = Event.all
        send_data(render_to_string, filename: filename_of(Event, 'csv'), type: 'text/csv; charset=UTF-8;')
      end
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @leads = @event.leads
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        flash[:notice] = success_message(controller_name, action_name)
        format.html { redirect_to @event }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        flash[:notice] = success_message(controller_name, action_name)
        format.html { redirect_to @event }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      flash[:notice] = success_message(controller_name, action_name)
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end

  # GET /events/new_import
  def new_import
    @data_import = DataImport.new
  end

  # POST /events/import
  def import
    @data_import = DataImport.new(params[:data_import])
    @data_import.model = Event
    if @data_import.save
      flash[:notice] = success_message(controller_name, action_name)
      redirect_to events_url
    else
      render :new_import
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:date_on, :name, :category, :summary)
    end
end
