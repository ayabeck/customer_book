class ContactsController < ApplicationController
  before_action :set_lead, only: [:new, :create, :export, :new_import, :import]
  before_action :set_contact, only: [:edit, :update, :destroy]

  # GET /leads/1/contacts/new
  def new
    @contact = @lead.contacts.new(date_on: Date.today)
  end

  # GET /contacts/1/edit
  def edit
  end

  # POST /leads/1/contacts
  # POST /leads/1/contacts.json
  def create
    @contact = @lead.contacts.new(contact_params)

    respond_to do |format|
      if @contact.save
        flash[:notice] = success_message(controller_name, action_name)
        format.html { redirect_to @contact.lead }
        format.json { render json: @contact, status: :ok }
      else
        format.html { render :new }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contacts/1
  # PATCH/PUT /contacts/1.json
  def update
    respond_to do |format|
      if @contact.update(contact_params)
        flash[:notice] = success_message(controller_name, action_name)
        format.html { redirect_to @contact.lead }
        format.json { render json: @contact, status: :ok }
      else
        format.html { render :edit }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    lead = @contact.lead
    @contact.destroy
    respond_to do |format|
      flash[:notice] = success_message(controller_name, action_name)
      format.html { redirect_to lead }
      format.json { head :no_content }
    end
  end

  # GET /leads/1/contacts/export
  def export
    @contacts = Contact.where(lead_id: @lead.id)
    send_data(render_to_string, filename: filename_of(Contact, 'csv', @lead), type: 'text/csv')
  end

  # GET /leads/1/contacts/new_import
  def new_import
    @data_import = DataImport.new
  end

  # POST /leads/1/contacts/import
  def import
    @data_import = DataImport.new(params[:data_import])
    @data_import.init(Contact, @lead)
    if @data_import.save
      flash[:notice] = success_message(controller_name, action_name)
      redirect_to @lead
    else
      render :new_import
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lead
      @lead = Lead.find(params[:lead_id])
    end
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.require(:contact).permit(:date_on, :content, :means, :owner, :lead_id)
    end
end
