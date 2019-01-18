class GuestsController < ApplicationController
  before_action :set_guest, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!
  # GET /guests
  # GET /guests.json
  def index
    @guests = Guest.joins("INNER JOIN rooms ON rooms.id = guests.room_id").where("room_id = ?",params[:room_id].to_i)
  end

  # GET /guests/1
  # GET /guests/1.json
  def show
    # SendBillingMailer.sample_email(@guest).deliver_now
  end

  # GET /guests/new
  def new
    @guest = Guest.new
  end

  # GET /guests/1/edit
  def edit
  end

  # POST /guests
  # POST /guests.json
  def create
    @guest = Guest.new(guest_params)
    respond_to do |format|
      if @guest.save
          @room = Room.find(@guest.room_id)
          @room.status = "hired"
          @room.save
        format.html { redirect_to room_guests_path(@guest.room_id,@guest), notice: 'Guest was successfully created.' }
        format.json { render :show, status: :created, location: @guest }
      else
        format.html { render :new }
        format.json { render json: @guest.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /guests/1
  # PATCH/PUT /guests/1.json
  def update
    respond_to do |format|
      if @guest.update(guest_params)
        format.html { redirect_to room_guests_path(@guest.room_id,@guest), notice: 'Guest was successfully updated.' }
        format.json { render :show, status: :ok, location: @guest }
      else
        format.html { render :edit }
        format.json { render json: @guest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /guests/1
  # DELETE /guests/1.json
  def destroy
    @g_bk = BackupGuest.find_by("name = '"+@guest.name+"' and created_at = '" +@guest.created_at.to_s+ "' and room_id = " +@guest.room.id.to_s)
    @g_bk.deleted_at = Time.now
    @g_bk.save
    @room = Room.find(@guest.room_id)
    @guest.destroy
    @guests = Guest.where("room_id = ? ",@room.id)
    if @guests.count == 0
      @room.status = "available"
      @room.deposit = 0
      @room.save
    end
    respond_to do |format|
      format.html { redirect_to room_guests_path(params[:room_id]), notice: 'Guest was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_guest
      @guest = Guest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def guest_params
      params.require(:guest).permit(:name, :birth, :address, :identitycard, :phonenumber, :image, :job, :notice, :room_id,:email)
    end
end
