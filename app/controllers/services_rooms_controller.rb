class ServicesRoomsController < ApplicationController
  before_action :set_services_room, only: [:show, :edit, :update, :destroy]

  # GET /services_rooms
  # GET /services_rooms.json
  def index
    @services_rooms = ServicesRoom.joins("INNER JOIN rooms ON rooms.id = services_rooms.room_id").where("room_id = ?",params[:room_id].to_i).order('created_at DESC')
    if params[:room_id]
      @room = Room.find(params[:room_id])
    end
  end

  # GET /services_rooms/1
  # GET /services_rooms/1.json
  def show
  end

  # GET /services_rooms/new
  def new
    @services_room = ServicesRoom.new
    @room = Room.find(params[:room_id])
    @sr = ServicesRoom.joins("INNER JOIN rooms ON rooms.id = services_rooms.room_id").where("room_id = ?",params[:room_id].to_i).last
    if @sr.nil?
      @services_room.electbegin = 0
      @services_room.waterbegin = 0
    else
      @services_room.electbegin = @sr.electend
      @services_room.waterbegin = @sr.waterend
    end

    @services_room.option1 = 0
    @services_room.option2 = 0
    @services_room.option3 = 0

  end

  # GET /services_rooms/1/edit
  def edit
  end

  # POST /services_rooms
  # POST /services_rooms.json
  def create
    @services_room = ServicesRoom.new(services_room_params)

    respond_to do |format|
      if @services_room.save
        format.html { redirect_to room_services_rooms_path(@services_room.room_id,@services_room.id), notice: 'Services room was successfully created.' }
        format.json { render :show, status: :created, location: @services_room }
      else
        format.html { render :new }
        format.json { render json: @services_room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /services_rooms/1
  # PATCH/PUT /services_rooms/1.json
  def update
    respond_to do |format|
      if @services_room.update(services_room_params)
        format.html { redirect_to room_services_rooms_path(@services_room.room_id), notice: 'Services room was successfully updated.' }
        format.json { render :show, status: :ok, location: @services_room }
      else
        format.html { render :edit }
        format.json { render json: @services_room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /services_rooms/1
  # DELETE /services_rooms/1.json
  def destroy
    @services_room.destroy
    respond_to do |format|
      format.html { redirect_to room_services_rooms_path, notice: 'Services room was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_services_room
      @services_room = ServicesRoom.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def services_room_params
      params.require(:services_room).permit(:datebegin, :dateend, :electbegin, :electend, :waterbegin, :waterend, :internet, :cleaner, :parking, :laundry, :option1, :option2, :option3,:room_id)
    end
end
