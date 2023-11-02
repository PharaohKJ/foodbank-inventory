class DonationRequestsController < ApplicationController
  before_action :set_donation_request, only: %i[ show edit update destroy accepted_paper thankyou]

  # GET /donation_requests or /donation_requests.json
  def index
    @donation_requests = DonationRequest.all.order(created_at: :desc)
  end

  # GET /donation_requests/1 or /donation_requests/1.json
  def show
  end

  # GET /donation_requests/new
  def new
    @donation_request = DonationRequest.new
    if params[:email].present?
      email = params[:email]
      dr = DonationRequest.where(email: email).order(:created_at).last || @donation_requests
      @donation_request.email = email
      if dr.present?
        @donation_request.company = dr.company
        @donation_request.name = dr.name
        @donation_request.tel = dr.tel
        @donation_request.address = dr.address
      end
    end
  end

  # GET /donation_requests/1/edit
  def edit
  end

  def thankyou
  end

  # POST /donation_requests or /donation_requests.json
  def create
    @donation_request = DonationRequest.new(donation_request_params)

    respond_to do |format|
      if @donation_request.save
        format.html { redirect_to donation_request_url(@donation_request), notice: "Donation request was successfully created." }
        format.json { render :show, status: :created, location: @donation_request }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @donation_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /donation_requests/1 or /donation_requests/1.json
  def update
    respond_to do |format|
      if @donation_request.update(donation_request_params)
        format.html { redirect_to donation_request_url(@donation_request), notice: "Donation request was successfully updated." }
        format.json { render :show, status: :ok, location: @donation_request }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @donation_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /donation_requests/1 or /donation_requests/1.json
  def destroy
    @donation_request.destroy

    respond_to do |format|
      format.html { redirect_to donation_requests_url, notice: "Donation request was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def entry
  end

  def accepted_paper

  end

  def entry_point
    email = params.dig(:form_entry, :email)
    if email.present?
      redirect_to new_donation_request_path(email:)
      return
    end
    redirect_to new_donation_request_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_donation_request
      @donation_request = DonationRequest.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def donation_request_params
      params.require(:donation_request).permit(:email, :company, :name, :address, :tel,
                                               donation_request_contents_attributes:
                                                 [:donation_request_id, :id, :maker, :expiry_date, :per_weight, :per_case, :count, :name, :content_type])
    end
end
