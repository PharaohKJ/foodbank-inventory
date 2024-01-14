class StoreRoomExitContentsController < ApplicationController
  before_action :set_store_room_exit_content, only: %i[ show edit update destroy ]

  # GET /store_room_exit_contents or /store_room_exit_contents.json
  def index
    @store_room_exit_contents = StoreRoomExitContent.all
  end

  # GET /store_room_exit_contents/1 or /store_room_exit_contents/1.json
  def show
  end

  # GET /store_room_exit_contents/new
  def new
    code = params[:code]
    code_map = StoreRoomExitContent.drive_code_map
    t = code_map[code.to_s.to_sym] || '不明'
    @store_room_exit_content = StoreRoomExitContent.new(
      code:,
      name: t,
      content_type: code.to_i,
      store_room_exit_id: params[:store_room_exit_id],
      is_drive: true,
    )
    @store_room_exit = StoreRoomExit.find(params[:store_room_exit_id])
  end

  # GET /store_room_exit_contents/1/edit
  def edit
  end

  # POST /store_room_exit_contents or /store_room_exit_contents.json
  def create
    @store_room_exit_content = StoreRoomExitContent.new(store_room_exit_content_params)
    @store_room_exit_content.weight = store_room_exit_content_params[:weight].to_f * 1_000
    respond_to do |format|
      if @store_room_exit_content.save
        format.html { redirect_to edit_store_room_exit_url(@store_room_exit_content.store_room_exit_id), notice: "ドライブの品を追加しました。" }
        format.json { render :show, status: :created, location: @store_room_exit_content }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @store_room_exit_content.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /store_room_exit_contents/1 or /store_room_exit_contents/1.json
  def update
    respond_to do |format|
      if @store_room_exit_content.update(store_room_exit_content_params)
        format.html { redirect_to store_room_exit_content_url(@store_room_exit_content), notice: "Store room exit content was successfully updated." }
        format.json { render :show, status: :ok, location: @store_room_exit_content }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @store_room_exit_content.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /store_room_exit_contents/1 or /store_room_exit_contents/1.json
  def destroy
    @store_room_exit_content.destroy
    respond_to do |format|
      format.html {
        redirect_to edit_store_room_exit_url(id: @store_room_exit_content.store_room_exit_id),
                    notice: "#{@store_room_exit_content.name} を削除しました.",
                    status: :see_other
      }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_store_room_exit_content
      @store_room_exit_content = StoreRoomExitContent.find(params[:id])
      @store_room_exit = StoreRoomExit.find(params[:store_room_exit_id])
    end

    # Only allow a list of trusted parameters through.
    def store_room_exit_content_params
      params.require(:store_room_exit_content)
            .permit(:store_room_exit_id, :code, :name, :weight, :content_type, :is_drive, :store_room_exit_id, :count)
    end
end
