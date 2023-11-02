class StoreRoomEntriesController < ApplicationController
  before_action :set_store_room_entry, only: %i[ show edit update destroy ]

  # GET /store_room_entries or /store_room_entries.json
  def index
    @store_room_entries = StoreRoomEntry.all
  end

  # GET /store_room_entries/1 or /store_room_entries/1.json
  def show
  end

  # GET /store_room_entries/new
  def new
    from_id = params[:donation_request_id]
    from_dr = DonationRequest.find(from_id)
    @store_room_entry = StoreRoomEntry.new
    @store_room_entry.donation_request_id = from_dr.id
    from_dr.donation_request_contents.each do |dr_content|
      dr_content.count.times do |i|
        y = dr_content.created_at.year % 1_000
        m = dr_content.created_at.month.to_s(16)
        d = dr_content.created_at.day
        @store_room_entry.store_room_entry_contents.build(
          maker: dr_content.maker,
          name: "#{dr_content.name}-#{i}",
          barcode: format("A#{y}#{m}#{d}%05<number>dA", number: i),
          donation_request_content_id: dr_content.id
        )
      end
    end
  end

  # GET /store_room_entries/1/edit
  def edit
  end

  # POST /store_room_entries or /store_room_entries.json
  def create
    @store_room_entry = StoreRoomEntry.new(store_room_entry_params)

    respond_to do |format|
      if @store_room_entry.save
        format.html { redirect_to store_room_entry_url(@store_room_entry), notice: "Store room entry was successfully created." }
        format.json { render :show, status: :created, location: @store_room_entry }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @store_room_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /store_room_entries/1 or /store_room_entries/1.json
  def update
    respond_to do |format|
      if @store_room_entry.update(store_room_entry_params)
        format.html { redirect_to store_room_entry_url(@store_room_entry), notice: "Store room entry was successfully updated." }
        format.json { render :show, status: :ok, location: @store_room_entry }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @store_room_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /store_room_entries/1 or /store_room_entries/1.json
  def destroy
    @store_room_entry.destroy

    respond_to do |format|
      format.html { redirect_to store_room_entries_url, notice: "Store room entry was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_store_room_entry
      @store_room_entry = StoreRoomEntry.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def store_room_entry_params
      params.require(:store_room_entry).permit(:donation_request_id)
    end
end
