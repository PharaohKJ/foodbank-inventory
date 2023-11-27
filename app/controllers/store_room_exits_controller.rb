class StoreRoomExitsController < ApplicationController
  before_action :set_store_room_exit, only: %i[ show edit update destroy input_weight update_input_weight]

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

  def input_weight
    @form = FormInputWeight.new
    @store_room_exit.store_room_exit_contents.where(is_drive: true).order(:code).uniq(&:code).each_with_index do |c, i|
      @form.send("name#{i+1}=", c.name)
      @form.send("weight#{i+1}=", 0)
    end
  end

  def update_input_weight
    binding.debugger
    f = FormInputWeight.new(input_weight_params)

    respond_to do |format|
      format.html {
        redirect_to store_room_exit_url(@store_room_exit),
                    notice: "出庫しました"
      }
    end
  end

  # POST /store_room_exits or /store_room_exits.json
  def create
    @store_room_exit                                  = StoreRoomExit.new(store_room_exit_params)
    from                                              = @store_room_exit.from_receive_donation_request_id
    @store_room_exit.from_receive_donation_request_id = ReceiveDonationRequest.last&.id
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
      if params[:commit] == 'この内容で出庫'
        if @store_room_exit.store_room_exit_contents.map(&:is_drive).include?(true)
          @store_room_exit.save!
          format.html {
            redirect_to input_weight_store_room_exit_path(@store_room_exit)
          }
        else
          @store_room_exit.draft = false
          @store_room_exit.save!
          format.html {
            redirect_to store_room_exit_url(@store_room_exit),
                        notice: "出庫しました"
          }
        end

      else
        c    = @store_room_exit.store_room_exit_contents.count
        code = params[:form_append_item][:code]
        lc = @store_room_exit.store_room_exit_contents.where(code:).count

        if code.to_s.start_with?('999')
          code_map = {
            '99900001': '菓子類',
            '99900002': '缶詰・瓶詰類',
            '99900003': '米・餅・粉・麺類',
            '99900004': '調味料類',
            '99900005': 'インスタント・レトルト類',
            '99900006': '飲料・嗜好品類',
            '99900007': '乾物類',
            '99900008': '乳児食・介護食・栄養補助食類',
            '99900009': 'その他',
          }
          t = code_map[code.to_s.to_sym] || '不明'
          created = @store_room_exit.store_room_exit_contents.create(
            code:,
            name: "#{t} (ドライブ)-#{lc + 1}",
            content_type: 1,
            is_drive: true
          )
          format.html {
            redirect_to edit_store_room_exit_url(@store_room_exit),
                        notice: "#{created.name}を追加しました"
          }
          format.json { render :show, status: :ok, location: @store_room_exit }

        else
          entry = StoreRoomEntryContent.find_by(barcode: code)
          if entry
            if lc.zero?
              created = @store_room_exit.store_room_exit_contents.create(
                code:,
                name:         entry.name,
                content_type: entry.content_type,
                weight:       entry.weight
              )
              format.html {
                redirect_to edit_store_room_exit_url(@store_room_exit),
                            notice: "#{created.name}を追加しました"
              }
            else
              format.html {
                redirect_to edit_store_room_exit_url(@store_room_exit),
                            notice: "#{code}は重複しています。"
              }
            end
          else
            format.html {
              redirect_to edit_store_room_exit_url(@store_room_exit),
                          notice: "#{code} はみつかりませんでした。"
            }
          end
        end
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

  def input_weight_params
    params.require(:form_input_weight).permit(
      :name1, :weight1, :name2, :weight2,
      :name3, :weight3, :name4, :weight4,
      :name5, :weight5, :name6, :weight6,
      :name7, :weight7, :name8, :weight8,
      :name9, :weight9
    )
  end
end
