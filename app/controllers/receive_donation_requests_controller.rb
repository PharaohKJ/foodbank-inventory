class ReceiveDonationRequestsController < ApplicationController
  before_action :set_receive_donation_request, only: %i[ show edit update destroy ]

  # GET /receive_donation_requests or /receive_donation_requests.json
  def index
    @receive_donation_requests = ReceiveDonationRequest.all
  end

  # GET /receive_donation_requests/1 or /receive_donation_requests/1.json
  def show
  end

  # GET /receive_donation_requests/new
  def new
    @receive_donation_request = ReceiveDonationRequest.new
  end

  # GET /receive_donation_requests/1/edit
  def edit
  end

  # POST /receive_donation_requests or /receive_donation_requests.json
  def create
    @receive_donation_request = ReceiveDonationRequest.new(receive_donation_request_params)

    respond_to do |format|
      if @receive_donation_request.save
        format.html { redirect_to receive_donation_request_url(@receive_donation_request), notice: "Receive donation request was successfully created." }
        format.json { render :show, status: :created, location: @receive_donation_request }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @receive_donation_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /receive_donation_requests/1 or /receive_donation_requests/1.json
  def update
    respond_to do |format|
      if @receive_donation_request.update(receive_donation_request_params)
        format.html { redirect_to receive_donation_request_url(@receive_donation_request), notice: "Receive donation request was successfully updated." }
        format.json { render :show, status: :ok, location: @receive_donation_request }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @receive_donation_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /receive_donation_requests/1 or /receive_donation_requests/1.json
  def destroy
    @receive_donation_request.destroy

    respond_to do |format|
      format.html { redirect_to receive_donation_requests_url, notice: "Receive donation request was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_receive_donation_request
      @receive_donation_request = ReceiveDonationRequest.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def receive_donation_request_params
      params.require(:receive_donation_request).permit(
        :organization_name, :tel, :name, :scheduled_at, :fax, :used_at, :reason)
    end
end
