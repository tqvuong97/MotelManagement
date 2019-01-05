class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!
  # GET /rooms
  # GET /rooms.json
  def index
  # @rooms = Room.searchroom(params[:r])
  # @rooms = Room.where("admin_id = ?",current_admin.id)
    @areas = Area.where(admin_id: current_admin.id).map { |a| [a.name, a.id] }
    if params[:r]
      @rooms = Room.where("admin_id = ? and name LIKE ?",current_admin.id,"%#{params[:r]}%").order('created_at DESC')
    else
      @rooms = Room.where("admin_id = ?",current_admin.id).order('created_at DESC')
    end
sql = "SELECT distinct month(s.dateend) as thang , sum(b.total) as tong FROM services_rooms s ,billings b where room_id in (select id from rooms where admin_id = "+current_admin.id.to_s+") and s.id = b.services_room_id group by(month(s.dateend)); "
@array = ActiveRecord::Base.connection.execute(sql).to_h


    # @roomss = @rooms
    # @roomss.each do |r1|
    #   @r11 = r1.services_rooms.each do |r2|
    #     # @r22 = r2.billings.each do |r3|
    #     #   @r33 = r3
    #     # end
    #
    #   end

  end


  # GET /rooms/1
  # GET /rooms/1.json
  def show
  end

  # GET /rooms/new
  def new
    @room = Room.new
    @areas = Area.where(admin_id: current_admin.id)
    @areas = @areas.map { |a| [a.name, a.id] }

  end
  # def createmanyrooms
  #   for i in 0..params[:quantity].to_i
  #     @r = Room.new(room_params)
  #     @r.name = "Room " + @r+" "+i
  #     @r.admin_id = current_admin.id.to_i
  #     @r.save
  #   end
  #   respond_to do |format|
  #     format.html { redirect_to rooms_path, notice: 'Room was successfully created.' }
  #   end
  # end

  # GET /rooms/1/edit
  def edit
     @areas = Area.where("admin_id = ?",current_admin.id).map { |a| [a.name, a.id] }
  end

  # POST /rooms
  # POST /rooms.json
  def create
    @room = Room.new(room_params)
    @room.name = "Room " +@room.name
    @room.admin_id = current_admin.id
    respond_to do |format|
      if @room.save
        format.html { redirect_to @room, notice: 'Room was successfully created.' }
        format.json { render :show, status: :created, location: @room }
      else
        format.html { render :new }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rooms/1
  # PATCH/PUT /rooms/1.json
  def update
    respond_to do |format|
      if @room.update(room_params)
        format.html { redirect_to @room, notice: 'Room was successfully updated.' }
        format.json { render :show, status: :ok, location: @room }
      else
        format.html { render :edit }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rooms/1
  # DELETE /rooms/1.json
  def destroy
    @room.destroy
    respond_to do |format|
      format.html { redirect_to rooms_url, notice: 'Room was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def room_params
      params.require(:room).permit(:name, :status, :price, :slot, :area_id,:admin_id,:r,:quantity,:deposit)
    end
end
