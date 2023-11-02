class StoreRoomExitsController < ApplicationController
  before_action :set_store_room_exit, only: %i[ show edit update destroy ]

  # GET /store_room_exits or /store_room_exits.json
  def index
    @store_room_exits = StoreRoomExit.all
  end

  # GET /store_room_exits/1 or /store_room_exits/1.json
  def show
  end

  # GET /store_room_exits/new
  def new
    @store_room_exit = StoreRoomExit.new
  end

  # GET /store_room_exits/1/edit
  def edit
  end

  # POST /store_room_exits or /store_room_exits.json
  def create
    @store_room_exit                                  = StoreRoomExit.new(store_room_exit_params)
    from                                              = @store_room_exit.from_receive_donation_request_id
    @store_room_exit.from_receive_donation_request_id = ReceiveDonationRequest.first&.id
    respond_to do |format|
      if @store_room_exit.save
        format.html {
          redirect_to edit_store_room_exit_url(@store_room_exit, from: from),
                      notice: "出庫申請を開始します"
        }
        format.json { render :show, status: :created, location: @store_room_exit }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @store_room_exit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /store_room_exits/1 or /store_room_exits/1.json
  def update
    respond_to do |format|
      c    = @store_room_exit.store_room_exit_contents.count
      code = params[:form_append_item][:code]
      if %w[9784814400492 1923055024007].include?(code.to_s)
        lc = @store_room_exit.store_room_exit_contents.where(code:).count
        created = @store_room_exit.store_room_exit_contents.create(
          code:,
          name: "重量で持ち出す食品(ドライブの食品)#{lc}-#{c + 1}"
        )
        format.html {
          redirect_to edit_store_room_exit_url(@store_room_exit),
                      notice: "#{created.name}を追加しました"
        }
        format.json { render :show, status: :ok, location: @store_room_exit }

      elsif @store_room_exit.store_room_exit_contents.find_by(code:).present?
        format.html {
          redirect_to edit_store_room_exit_url(@store_room_exit),
                      notice: "#{code}は重複しています。"
        }
      else
        created = @store_room_exit.store_room_exit_contents.create(
          code:,
          name: "バーコードで辞書引きした食品#{c + 1}"
        )
        format.html {
          redirect_to edit_store_room_exit_url(@store_room_exit),
                      notice: "#{created.name}を追加しました"
        }
        format.json { render :show, status: :ok, location: @store_room_exit }
      end
    end
  end

  # DELETE /store_room_exits/1 or /store_room_exits/1.json
  def destroy
    @store_room_exit.destroy

    respond_to do |format|
      format.html { redirect_to store_room_exits_url, notice: "Store room exit was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_store_room_exit
    @store_room_exit = StoreRoomExit.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def store_room_exit_params
    params.require(:store_room_exit).permit(:from_receive_donation_request_id)
  end
end
