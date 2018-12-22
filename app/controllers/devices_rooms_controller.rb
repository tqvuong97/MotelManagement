class DevicesRoomsController < ApplicationController
  before_action :set_devices_room, only: [:show, :edit, :update, :destroy]

  # GET /devices_rooms
  # GET /devices_rooms.json
  def index
    @devices_rooms = DevicesRoom.joins("INNER JOIN devices ON devices.id = devices_rooms.device_id").where("room_id = ?",params[:room_id].to_i)
    @room = Room.find(params[:room_id])
  end
  # select('devices_rooms.id,devices_rooms.status ,devices_rooms.quantity ,
  #                       devices_rooms.datebegin ,devices.name ,devices.id ,devices_rooms.device_id ')

  # GET /devices_rooms/1
  # GET /devices_rooms/1.json
  def show

  end

  # GET /devices_rooms/new
  def new
    @devices_room = DevicesRoom.new
    @devices = Device.all.map { |a| [a.name, a.id] }
    @room = Room.find(params[:room_id])
    # @devices_room = @room.devices_rooms.build

  end

  # GET /devices_rooms/1/edit
  def edit
    @devices = Device.all.map { |a| [a.name, a.id] }
  end

  # POST /devices_rooms
  # POST /devices_rooms.json
  def create
    # @room = Room.find(1)
    # @devices_room = @room.devices_rooms.build(params[:devices_room])
    @devices_room = DevicesRoom.new(devices_room_params)


    # @devices_room.room_id = 1
    respond_to do |format|
      if @devices_room.save
        format.html { redirect_to room_devices_room_path(@devices_room.room_id,@devices_room.id) ,notice: 'Devices room was successfully created.' }
        format.json { render :show, status: :created, location: @devices_room }
      else
        format.html { render :new }
        format.json { render json: @devices_room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /devices_rooms/1
  # PATCH/PUT /devices_rooms/1.json
  def update

    respond_to do |format|
      if @devices_room.update(devices_room_params)
        format.html { redirect_to room_devices_room_path(@devices_room.room_id), notice: 'Devices room was successfully updated.' }
        format.json { render :show, status: :ok, location: @devices_room }
      else
        format.html { render :edit }
        format.json { render json: @devices_room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /devices_rooms/1
  # DELETE /devices_rooms/1.json
  def destroy
    @devices_room.destroy
    respond_to do |format|
      format.html { redirect_to room_devices_rooms_path(@devices_room.room_id), notice: 'Devices room was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_devices_room
      @devices_room = DevicesRoom.find(params[:id])
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def devices_room_params
      params.require(:devices_room).permit(:status, :quantity, :datebegin, :room_id, :device_id)
    end
end
