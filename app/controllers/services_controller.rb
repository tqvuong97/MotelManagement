class ServicesController < ApplicationController
  before_action :set_service, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!
  # GET /services
  # GET /services.json
  def index
    @services = Service.where("admin_id = ?",current_admin.id)
  end

  # GET /services/1
  # GET /services/1.json
  def show
  end

  # GET /services/new
  def new
    @service = Service.new
  end

  # GET /services/1/edit
  def edit
  end

  def createservice
    ad = current_admin.id
    service_electric = Service.create(name: "Dien ",unit:"kWh" ,cost: 3000 ,admin_id: ad)
    service_water = Service.create(name: "Nuoc ",unit:"cm3" ,cost: 20000 ,admin_id: ad )
    service_internet = Service.create(name: "Internet ",unit:"phong" ,cost: 50000 ,admin_id: ad )
    service_cleaner = Service.create(name: "Ve sinh ",unit:"phong" ,cost: 25000 ,admin_id: ad )
    service_parking = Service.create(name: "Gui xe ",unit:"xe" ,cost: 100000 ,admin_id: ad)
    service_laundry = Service.create(name: "Giat ui ",unit:"kg" ,cost: 20000 ,admin_id: ad )
    service_option1 = Service.create(name: "Option 1 ",unit:"none" ,cost: 0 ,admin_id: ad )
    service_option2 = Service.create(name: "Option 2 ",unit:"none" ,cost: 0 ,admin_id: ad )
    service_option3 = Service.create(name: "Option 3 ",unit:"none" ,cost: 0 ,admin_id: ad )
    respond_to do |format|
      format.html { redirect_to services_path, notice: 'Service was successfully created.' }


    end



  end

  # POST /services
  # POST /services.json
  def create
    @service = Service.new(service_params)
    @service.admin_id = current_admin.id

    respond_to do |format|
      if @service.save
        format.html { redirect_to @service, notice: 'Service was successfully created.' }
        format.json { render :show, status: :created, location: @service }
      else
        format.html { render :new }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /services/1
  # PATCH/PUT /services/1.json
  def update
    respond_to do |format|
      if @service.update(service_params)
        format.html { redirect_to @service, notice: 'Service was successfully updated.' }
        format.json { render :show, status: :ok, location: @service }
      else
        format.html { render :edit }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /services/1
  # DELETE /services/1.json
  def destroy
    @service.destroy
    respond_to do |format|
      format.html { redirect_to services_url, notice: 'Service was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service
      @service = Service.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def service_params
      params.require(:service).permit(:name, :unit, :cost,:admin_id)
    end
end
