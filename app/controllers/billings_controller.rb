require 'nexmo'
class BillingsController < ApplicationController

  before_action :set_billing, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!
  # GET /billings
  # GET /billings.json
  def index
    @billings = Billing.where("services_room_id = ?",params[:services_room_id])
  end

  # GET /billings/1
  # GET /billings/1.json
  def show
    # client = Nexmo::Client.new(
    #     api_key: "29784dbb",
    #     api_secret: "R7RrOS0lhE5IlACX"
    # )
    #
    # client.sms.send(
    #     from: "51503120",
    #     to: "84987113442",
    #     text: "-Bill-  " + "  Room : "+@billing.services_room.room.name.to_s+ " From : "+ @billing.services_room.datebegin.to_s + " To : " + @billing.services_room.dateend.to_s + " Total : " + @billing.total.to_s
    # )
    respond_to do |format|
      # format.html { redirect_to room_services_room_billing_path(@billing.services_room.room.id,@billing.services_room_id) ,notice: 'Billing was successfully exported.'}
      # format.json { render :show, status: :created, location: @billing }
      format.xls
    end
    @t = @billing.services_room.room.guests
    @t.each do |t|
      # SendBillingMailer.sample_email(t,@billing).deliver_now
    end
  end

  # GET /billings/new
  def new
    @billing = Billing.new
    @services_room = ServicesRoom.find(params[:services_room_id])
    @room = Room.find(params[:room_id])
    @billing.option1 = 0
    @billing.option2 = 0
    @billing.option3 = 0
    @billing.bominus = 0

  end

  # GET /billings/1/edit
  def edit
  end

  # POST /billings
  # POST /billings.json
  def create
    @billing = Billing.new(billing_params)
    @billing.payment = false
    @services_room = ServicesRoom.find(@billing.services_room_id)
    @billing.electric = (@services_room.electend - @services_room.electbegin)*Service.find_by(admin_id: current_admin.id,name: "Dien").cost
    @billing.water = (@services_room.waterend - @services_room.waterbegin)*Service.find_by(admin_id: current_admin.id,name: "Nuoc").cost
    @billing.internet = (@services_room.internet)*Service.find_by(admin_id: current_admin.id,name: "Internet").cost
    @billing.cleaner = (@services_room.cleaner)*Service.find_by(admin_id: current_admin.id,name: "Ve sinh").cost
    @billing.parking = (@services_room.parking)*Service.find_by(admin_id: current_admin.id,name: "Gui xe").cost
    @billing.laundry = (@services_room.laundry)*Service.find_by(admin_id: current_admin.id,name: "Giat ui").cost
    @billing.option1 = (@services_room.option1)*Service.find_by(admin_id: current_admin.id,name: "Option 1").cost
    @billing.option2 = (@services_room.option2)*Service.find_by(admin_id: current_admin.id,name: "Option 2").cost
    @billing.option3 = (@services_room.option3)*Service.find_by(admin_id: current_admin.id,name: "Option 3").cost
    @billing.rentingfee = @services_room.room.price
    @billing.total = @billing.electric +  @billing.water +  @billing.internet +  @billing.cleaner + @billing.parking + @billing.laundry + @billing.option1 + @billing.option2 + @billing.option3 + @billing.rentingfee - @billing.bominus
    respond_to do |format|
      if @billing.save
        format.html { redirect_to room_services_room_billings_path(@billing.services_room.room.id,@billing.services_room_id), notice: 'Billing was successfully created.' }
        format.json { render :show, status: :created, location: @billing }
      else
        format.html { render :new }
        format.json { render json: @billing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /billings/1
  # PATCH/PUT /billings/1.json
  def update
    respond_to do |format|
      if @billing.update(billing_params)
        format.html { redirect_to @billing, notice: 'Billing was successfully updated.' }
        format.json { render :show, status: :ok, location: @billing }
      else
        format.html { render :edit }
        format.json { render json: @billing.errors, status: :unprocessable_entity }
      end
    end
  end
  def updatepayment
    @billing = Billing.find(params[:billing_id])
    @billing.payment = true
    @billing.save
    # # @billing.payment = true
    respond_to do |format|

      # @billing.update_attribute(payment: true)
      format.html{ redirect_to room_services_room_billings_path(params[:room_id],params[:services_room_id]), notice: "This billing was successfully paid." }
    end
  end


  # DELETE /billings/1
  # DELETE /billings/1.json
  def destroy
    @billing.destroy
    respond_to do |format|
      format.html { redirect_to room_services_room_billings_path(@billing.services_room.room.id,@billing.services_room_id), notice: 'Billing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_billing
      @billing = Billing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def billing_params
      params.require(:billing).permit(:electric, :water, :internet, :cleaner, :parking, :laundry, :option1, :option2, :option3,:services_room_id,:total,:rentingfee,:bominus,:note,:payment)
    end
end
